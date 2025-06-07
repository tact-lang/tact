struct PrimitiveDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "abc";
}

contract PrimDefaults {
    p: PrimitiveDefaults;

    init() {
        self.p = PrimitiveDefaults{};
    }
}