contract TestLiteralString {
    receive() {
        dump("Hello World");
        dump("First Line\nSecond Line");
        dump("Quote: \"Tact\"");
    }
}
