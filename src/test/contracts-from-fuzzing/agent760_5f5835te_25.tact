contract ImplicitNull {
    i: Int?;
    b: Bool?;
    s: String?;

    init() {
        let _ = self.i;
        let _ = self.b;
        let _ = self.s;
    }
}