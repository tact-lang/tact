struct ComplexDefaults {
    i: Int = 1;
    s: String = "s";
    b: Bool = true;
    oi: Int? = null;
    os: String? = null;
}

struct NestedComplex {
    foo: ComplexDefaults;
    bar: Int;
}

contract NestedDefaultTest {
    nested: NestedComplex;

    init() {
        self.nested = NestedComplex{
            foo: ComplexDefaults{},
            bar: 42
        };
    }
}