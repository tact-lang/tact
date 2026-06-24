struct WrappedOptional {
    a: Int?;
    b: InnerOpt?;
}

struct InnerOpt {
    foo: Int?;
    bar: Int;
}

contract OptionalInStruct {
    data: WrappedOptional;

    init() {
        self.data = WrappedOptional{
            a: null,
            b: InnerOpt{ foo: null, bar: 2 },
        };
    }
}