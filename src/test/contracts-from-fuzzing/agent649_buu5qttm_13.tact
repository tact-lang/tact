contract EmptyOptDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
    receive() {
        let _ = self.a;
    }
}