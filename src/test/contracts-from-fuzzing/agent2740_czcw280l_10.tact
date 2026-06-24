struct SDefault {
    a: Int = 0;
    b: Bool = false;
    c: String = "test";
}

contract StructWithDefaults {
    sf: SDefault;

    init() {
        self.sf = SDefault{};
    }
}