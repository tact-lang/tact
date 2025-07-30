struct Inner {
    foo: Int?;
    bar: Bool?;
}

struct Mixed {
    i: Int;
    s: String?;
    nested: Inner?;
}

contract ComplexOptionals {
    data: Mixed;

    init() {
        self.data = Mixed{
            i: 99,
            s: null,
            nested: null
        };
    }
}