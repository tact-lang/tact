contract Test {
    receive() {
        let s: String = "Hello, TON!";
        let s_copy: String = s.asSlice().asString();
        if (s == s_copy) {
            dump("Round-trip conversion successful");
        } else {
            dump("Round-trip conversion failed");
        }
        let h: Int = s.hashData();
        dump(h);
    }
}
