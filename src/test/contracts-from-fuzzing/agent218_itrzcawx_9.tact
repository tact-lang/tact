struct Defaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "foo";
}

contract StructWithDefaults {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}