contract TestLiteralString {
    receive() {
       let s: String = "Tact is awesome!";
       dump(s);
    }
}
