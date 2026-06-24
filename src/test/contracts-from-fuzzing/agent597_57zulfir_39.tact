contract DefaultNullMix {
    a: Int?;
    b: Bool;
    c: String?;
    d: Int;
    e: Bool?;
    init() {
        self.b=false;
        self.d=42;
    }
}