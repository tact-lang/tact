struct SomeDefaults {
    i: Int = 5;
    s: String = "hi";
    b: Bool = false;
}

contract StructWithDefaults {
    f: SomeDefaults;

    init() {
        self.f = SomeDefaults{};
    }
}
