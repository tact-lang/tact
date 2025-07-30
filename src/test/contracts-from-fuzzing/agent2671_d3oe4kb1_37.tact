struct NestedOptStruct {
    inner: OptionalStruct?;
    another: Int;
}

struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract ContractWithOptStruct {
    data: NestedOptStruct;

    init() {
        self.data = NestedOptStruct{
            inner: OptionalStruct{ foo:7, bar:false },
            another: 99
        };
    }
}