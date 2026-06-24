struct Defaulted {
    foo: Int = 42;
    bar: Bool = true;
    baz: String = "hi";
}

contract StructDefaults {
    s: Defaulted;
    init() {
        self.s = Defaulted{};
    }
}