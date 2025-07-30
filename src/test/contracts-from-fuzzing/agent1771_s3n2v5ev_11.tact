struct Defaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
}

contract StructWithDefaults {
    f: Defaults;

    init() {
        self.f = Defaults{};
    }
}