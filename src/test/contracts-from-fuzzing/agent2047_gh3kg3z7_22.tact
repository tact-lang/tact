struct Defaulted {
    foo: Int = 1;
    bar: Bool = true;
    baz: String = "abc";
}

contract StructWithDefaults {
    s: Defaulted;

    init() {
        self.s = Defaulted{};
    }
}