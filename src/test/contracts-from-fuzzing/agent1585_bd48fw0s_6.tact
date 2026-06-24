struct InnerOptional {
    foo: Int?;
    bar: Bool?;
}

struct OuterOptional {
    nested: InnerOptional?;
    value: Int;
}

contract OptionalStructs {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            nested: null,
            value: 0
        };
    }
}