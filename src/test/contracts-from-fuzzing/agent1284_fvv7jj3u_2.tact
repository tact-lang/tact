struct NestedOptionalStruct {
    foo: Int?;
    bar: Bool?;
    baz: InnerOptional?;
}

struct InnerOptional {
    x: Int;
    y: String?;
}

contract PersistentOpt {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{
            foo: null,
            bar: true,
            baz: InnerOptional{
                x: 1,
                y: null,
            },
        };
    }
}