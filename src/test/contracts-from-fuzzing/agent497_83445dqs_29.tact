struct SDF {
    a: Int = 7;
    b: Bool = false;
    c: String = "str";
}

contract StructWithDefaults {
    v: SDF;

    init() {
        self.v = SDF{};
    }
}