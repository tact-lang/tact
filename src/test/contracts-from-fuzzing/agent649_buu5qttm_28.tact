contract OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    receive() {
        let _ = self.c;
    }
}