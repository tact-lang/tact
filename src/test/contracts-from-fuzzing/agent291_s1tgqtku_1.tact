struct NestedOptional {
    foo: Int?;
    bar: String?;
    baz: Bool?;
}

contract TestContract {
    no1: Int?;
    no2: String?;
    no3: Bool?;
    nested: NestedOptional;

    init() {
        self.no1 = null;
        self.no2 = null;
        self.no3 = null;
        self.nested = NestedOptional{
            foo: null,
            bar: null,
            baz: null,
        };
    }
}