struct NestedOptional {
    foo: Int?;
    bar: Bool?;
}

struct OuterStruct {
    inner: NestedOptional;
    flag: Bool;
}

contract ComplexPersistent {
    info: OuterStruct;

    init() {
        self.info = OuterStruct{
            inner: NestedOptional{ foo: 42, bar: true },
            flag: false,
        };
    }
}
