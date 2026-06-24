contract Test {
    receive() {
        // Test an empty string built from a StringBuilder
        let s: String = beginString().toString();
        dump(s);
    }
}
