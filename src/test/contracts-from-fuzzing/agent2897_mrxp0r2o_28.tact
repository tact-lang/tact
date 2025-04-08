contract DefaultsOptionalMix {
    a: Int = 5;
    b: Int?;
    c: String = "x";
    d: Bool?;
    init() {
        self.b = 10;
        self.d = true;
    }
}