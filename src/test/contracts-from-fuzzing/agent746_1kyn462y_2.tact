struct InnerOptional {
    foo: Int;
}

struct OuterOptional {
    nested: InnerOptional?;
    flag: Bool;
}

contract OptionalNestedStorage {
    nestedOpt: OuterOptional;

    init() {
        self.nestedOpt = OuterOptional{
            nested: null,
            flag: true
        };
    }
}