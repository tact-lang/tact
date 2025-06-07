contract TestStringLiterals {
    receive() {
        let a: String = "Hello \n Tact!"; // testing escape sequence \n
        let b: String = "Quote: \"Tact\"!"; // testing escape sequence for quotes
    }
}