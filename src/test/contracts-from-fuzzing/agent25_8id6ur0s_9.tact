contract TestStringBase64 {
    receive() {
        let s: String = "SGVsbG8=";
        let dec: Slice = s.fromBase64();
    }
}