
#安裝usethis套件
install.packages("usethis")
library(usethis)


#安裝devtools套件
install.packages("devtools")
library(devtools)


#透過github安裝gideon套件
devtools::install_github("gideononline/gideon-api-r")
library(gideon)


#完整資訊參照：
?gideon


#開啟編輯器編輯.Renviron file將API key存入於此檔案
usethis::edit_r_environ()
#打開後存API key語法為GIDEON_API_KEY=<YOUR API KEY>，輸入完畢儲存。


#呼叫gideon的lookup_gideon_id方法回傳COVID-19的diseases_id，
#存入給COVID_19_id，並將此id透過gideon的outbreaks_by_diseases方法
#回傳關於COVID-19的outbreaks消息，並存入COVID_19_outbreaks。
COVID_19_id <- lookup_gideon_id("diseases",item = "COVID-19")  #lookup_gideon_id語法：lookup_gideon_id(category, item = NULL, error_msg = TRUE)
COVID_19_outbreaks <- outbreaks_by_disease(COVID_19_id)  #outbreaks_by_disease語法：outbreaks_by_disease(disease)
print(COVID_19_outbreaks)


#將三個我需要的欄位(cases, country_name, country_code)取出並合成data frame。
cases_ls <- c(COVID_19_outbreaks[["cases"]])
country_name_ls <- c(COVID_19_outbreaks[["country_name"]])
country_code_ls <- c(COVID_19_outbreaks[["country_code"]]) 
country_and_cases <- data.frame(country_code_ls,country_name_ls,cases_ls)
#重新命名欄位名稱
names(country_and_cases) <- c("Country_code","Country","Cases")
print(country_and_cases)


#將確診案例高於500萬的國家篩選出來，並將這幾個國家的country_id挑出，以利後面使用。
cases_higher_than_5million = subset(country_and_cases, subset = cases_ls > 5000000) #R subset()語法：subset(x, subset, select, drop = FALSE, …)
final_country_code <- c(cases_higher_than_5million$Country_code)
print(final_country_code)


#以迴圈的方式將剛剛取出的country_code填入呼叫API的URL內，
#回傳後存入df_total這個data frame內。
df_total <- data.frame()
for (i in 1:length(final_country_code)) {
  result <- query_gideon_api(paste0("/travel/countries/",final_country_code[i],"/cdc-recommendation"))
  df <- data.frame(result)
  df_total <- rbind(df_total,df)
}


#將Country, Cases, 以及剛剛透過API取出的recommendation合成一張data frame。
total_chart <- cbind(Country=c(cases_higher_than_5million$Country),
                     Cases=c(cases_higher_than_5million$Cases),
                     cdc_recommendation=c(df_total$yellow_fever_cdc_recommendations)
                     )


#檢視圖表
View(total_chart)

#如果想再從頭跑一次執行清除所有變數：
#清除所有變數
rm(list=ls(all=TRUE))
