struct ComplexOptional {
    innerOpt: Inner?;
    s: String;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract OptionalNested {
    co: ComplexOptional;

    init() {
        self.co = ComplexOptional{
            innerOpt: null,
            s: "hi"
        };
    }
}