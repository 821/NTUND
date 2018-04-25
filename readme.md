# 臺北帝國大學三民主義研究所博碩士論文模板

## 用語
「臺北帝國大學」、「三民主義研究所」、「常凱申」等名詞的時代背景衝突，本模板負責搞笑不負責解釋。

## 特色
一、本模板參照三研所論文規範編寫。三研所的參考文獻規範又根據三民主義研究期刊，三民主義研究期刊的規範則是一種APA格式的變體，所以本模板的重點是中英結合的APA格式。  
一、鑑於敝所除貧僧外沒人會用TeX，而貧僧使用的文獻種類不多，所以並非完整APA。  
一、本模板通過文獻標題識別文獻語文，標題含CJK文字的文獻一律識別爲中日韓文，不含則識別爲英文。這部分代碼參考biblatex-japanese。識別方式很粗暴，不過在貧僧的領域裏目前正確率爲100%。  
一、GitHub上一些帝大模板幾乎衹管樣式不管文獻，本模板參考了他們寫的樣式——因爲懶得自己想怎麼寫。  

## 環境
OS: Windows 10 RS4  
TeX distribution: TeX Live 2016  
TeX engine: XeLaTeX  
BibTex engine: BibLaTeX  
Encoding: UTF-8  
PDF viewer: SumatraPDF  

## 文獻錄入
book  
inbook  
article  
thesis  
newspaper  
news: 新聞報導  
online  
simple: 對簡單的文獻，比如法規和領導人講話，提供一個僅錄入作者、年份、標題、發表場合（標記爲journal）的簡單格式  

## 文獻引用
`\cite{}`: 形如`（張友珊、楊志良，1999）`、`(Bradford and Martin, 1995)`  
`\ycite{}`: 形如`（1999）`、`(1995)`  
`\citeay{}`: 形如`張友珊、楊志良，1999`、`Bradford and Martin, 1995`  
`\pcite{}{}`: 形如`（張友珊、楊志良，1999：1）`、`（Bradford and Martin, 1995: 1）`，第二個括號內塡頁碼  
`\citep{}{}`: 形如`張友珊、楊志良，1999：1`、`Bradford and Martin, 1995: 1`，第二個括號內塡頁碼  
