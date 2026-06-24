contract TestStringUnicodeMax {
    receive() {
        let x: String = "Test \u{10FFFF} end";
    }
}