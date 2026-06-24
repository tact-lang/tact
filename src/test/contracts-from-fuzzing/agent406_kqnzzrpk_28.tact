struct PrimitiveDefaults {
    a: Int = 0;
    b: Bool = false;
    c: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    d: String = "";
}

contract TestContract {
    p: PrimitiveDefaults;
    init() {
        self.p = PrimitiveDefaults{};
    }
}