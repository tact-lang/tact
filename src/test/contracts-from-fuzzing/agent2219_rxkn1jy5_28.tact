struct NestedManyDefaults {
    a: Int = 5;
    b: String = "s";
    c: Bool = true;
    d: String? = null;
    e: Int? = null;
}

contract DefaultsNested {
    f: NestedManyDefaults;

    init() {
        self.f = NestedManyDefaults{
            a: 6,
            b: "t",
            c: false,
            d: null,
            e: null
        };
    }
}