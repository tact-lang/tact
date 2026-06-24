contract TestStringUnicode1 {
    receive() {
        let emoji: String = "Hello \u{1F602} Tact!";
    }
}