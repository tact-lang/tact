struct PrimitiveDefaults {
    i: Int = 3;
    b: Bool = true;
    o: Int? = null;
}

contract PrimDef {
    f: PrimitiveDefaults;

    init() {
        self.f = PrimitiveDefaults{};
    }
}