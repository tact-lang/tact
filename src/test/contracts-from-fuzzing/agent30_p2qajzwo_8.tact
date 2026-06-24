contract TestLiteralString {
    receive() {
        let s: String = "Tact is awesome!";
        let comment = s.asComment();
        comment;
    }
}
