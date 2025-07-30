struct InnerMost {
    a: Int;
    b: Bool;
    c: String;
}

struct MiddleOptional {
    x: InnerMost?;
    y: Int;
}

struct OuterMost {
    foo: MiddleOptional;
    bar: Bool;
}

contract ComplexNested {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            foo: MiddleOptional{
                x: null,
                y: 11
            },
            bar: false
        };
    }
}