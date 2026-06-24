contract TestDoubleQuoteEscape {
    receive() {
        let s: String = "this \" quotes works";
    }
}
