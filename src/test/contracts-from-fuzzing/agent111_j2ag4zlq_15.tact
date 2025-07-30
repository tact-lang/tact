struct NestedDefaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "hello";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract DefaultsInNested {
    f: NestedDefaults;
    init() {
        self.f = NestedDefaults{
            d: null,
            e: null,
            f: null
        };
    }
}