# MVVM Combine Swift (2022) | UIKit | Transform Input & Output

## 前言
- 本影片展示了如何在 **UIKit** 中使用 **MVVM** 設計模式，並將 **Combine** 框架整合到架構中。重點講解了輸入（Input）與輸出（Output）的轉換過程，這有助於管理應用中的業務邏輯和 UI 更新。

## MVVM 與 Combine 框架

### 為何選擇 MVVM
- **MVVM** 模式有助於將應用邏輯與視圖分離，使代碼更易於測試和維護。
- View Controller 在此模式中應該「愚蠢」（dumb），即僅負責接收用戶輸入，並將它們傳遞給 ViewModel。這樣可以確保所有邏輯在 ViewModel 中處理，而非 View Controller。

### Combine 框架的使用
- **Combine** 是蘋果推出的響應式編程框架，用來處理數據流。在 MVVM 中，Combine 可用來監聽輸入事件並生成輸出，以更新視圖。
- 常用的 `PassThroughSubject` 可以在不保留任何初始狀態的情況下傳遞數據，而 `CurrentValueSubject` 則保留最後一次的數據狀態。

## 輸入與輸出的設計

### 定義輸入與輸出
- **輸入（Input）**：表示用戶的行為，如視圖的加載（`viewDidAppear`）或按鈕點擊（`refreshButtonTapped`）。
- **輸出（Output）**：表示 ViewModel 生成的結果，包括成功的數據更新或失敗的錯誤處理。輸出可通過 Publisher 傳遞到 View Controller 來更新 UI。

### 處理 API 請求
- 在 ViewModel 中，透過 Combine 框架使用 `URLSession` 發送 API 請求，並將請求結果映射成 Publisher 的輸出。如果請求成功，則傳回新的數據；如果失敗，則返回錯誤信息。
- 例如，當按下「刷新」按鈕後，API 請求將被觸發，並且按鈕會在請求期間被禁用，待請求結束後重新啟用。

## Combine 的進階應用

### 資料流的處理與轉換
- **`map`**：用來將 API 返回的數據進行轉換。例如，從 API 中取得的 JSON 資料會通過 `map` 轉換為應用中的數據模型。
- **`sink`**：用來訂閱 Publisher 並接收其輸出。當請求成功後，`sink` 會接收到新數據並更新 UI。

### 錯誤處理
- 使用 `catch` 來捕捉數據流中的錯誤。例如，如果 API 請求失敗，可以顯示錯誤信息，而不會讓應用崩潰。
- **`Completion`**：可以用來處理數據流的完成或錯誤，這能讓我們在 UI 層適當地顯示請求結果。

## 依賴注入與單元測試

### 依賴注入
- **依賴注入** 是 MVVM 中的重要概念，透過將服務注入到 ViewModel，我們可以輕鬆進行測試和模擬。這使得我們可以在單元測試中替換真實的 API 請求，並使用模擬數據進行驗證。

### 單元測試的優勢
- 將 API 請求與邏輯封裝在 ViewModel 中後，可以輕鬆撰寫單元測試，測試不同情況下的輸入與輸出。這樣可以確保業務邏輯的正確性而不依賴 UI 層。

### 重點整理
- **MVVM 與 Combine 整合**：ViewModel 負責邏輯與數據處理，View Controller 只負責 UI 呈現。
- **輸入與輸出**：定義用戶行為作為輸入，並使用 Publisher 將結果作為輸出傳遞到視圖。
- **進階數據流處理**：使用 `map`、`sink` 等來處理數據轉換與 UI 更新，並使用 `catch` 進行錯誤處理。
- **依賴注入與測試**：透過依賴注入實現單元測試，使得應用邏輯的測試更加靈活。

這些技巧不僅能幫助構建更清晰的代碼結構，還能提升應用的可測試性和維護性。
