struct HasOptionalStruct {
    nested: Inner?;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract OptionalStructField {
    foo: HasOptionalStruct;

    init() {
        self.foo = HasOptionalStruct{
            nested: null,
        };
    }
}