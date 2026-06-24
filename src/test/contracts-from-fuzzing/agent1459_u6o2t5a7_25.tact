struct PrimitiveDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "abc";
}

contract PrimitivesDefaulted {
    s: PrimitiveDefaults;

    init() {
        self.s = PrimitiveDefaults{};
    }
}
