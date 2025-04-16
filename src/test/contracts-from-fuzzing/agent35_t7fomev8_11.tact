struct HasOptionalStruct {
    s: NestedStruct?;
}

struct NestedStruct {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    data: HasOptionalStruct;

    init() {
        self.data = HasOptionalStruct{
            s: NestedStruct{
                foo: 123,
                bar: false,
            },
        };
    }
}
