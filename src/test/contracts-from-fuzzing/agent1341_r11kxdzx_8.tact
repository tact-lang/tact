struct Inner {
    foo: Int?;
    bar: Bool?;
}

struct Outer {
    nested: Inner?;
}

contract ComplexOpt {
    data: Outer;

    init() {
        self.data = Outer{
            nested: null
        };
    }
}