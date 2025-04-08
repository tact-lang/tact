struct NestedManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: Bool = false;
    e: String = "abc";
}

contract ManyDefaultsNested {
    n: NestedManyDefaults;

    init() {
        self.n = NestedManyDefaults{};
    }
}
