contract Test {
    receive() {
         // Test multiple escape sequences: carriage return, vertical tab, backspace, form feed
         let s: String = "Line\rCarriage \vVertical \bBackspace \fFormfeed";
    }
}
