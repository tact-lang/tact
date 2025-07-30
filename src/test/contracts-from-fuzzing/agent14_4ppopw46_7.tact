contract TestEmptyString {
    receive() {
        // Test empty string literal conversion: string -> slice -> string
        let s: String = "";
        let s2: String = s.asSlice().asString();
        dump(s2);
    }
}
