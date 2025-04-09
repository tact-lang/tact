contract NoInitAllDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    receive() {
        let _ = self.c;
    }
}