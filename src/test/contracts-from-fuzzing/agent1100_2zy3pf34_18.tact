contract DefaultOptionalInit {
    a: Int?;
    b: Bool?;
    c: Address?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
    }
}
