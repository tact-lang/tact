struct BigNestedDefaults {
    inner: InnerMost;
}

struct InnerMost {
    foo: Int = 5;
    bar: Bool = true;
    baz: String = "yo";
}

contract BigDefaults {
    big: BigNestedDefaults;

    init() {
        self.big = BigNestedDefaults{
            inner: InnerMost{},
        };
    }
}