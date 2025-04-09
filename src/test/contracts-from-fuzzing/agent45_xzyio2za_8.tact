contract TestEmptyString {
    receive() {
        let s: String = "";
        dump(s);
    }
}
