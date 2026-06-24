struct FlatDefaults {
    a: Int = 1;
    b: Bool = true;
    c: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    d: String = "sample";
}

contract StructFlatDefaults {
    s: FlatDefaults;
    init() {
        self.s = FlatDefaults{};
    }
}