struct NestedOptionalStruct {
    foo: Int?;
    bar: Bool?;
    baz: Slice?;
}

contract TestContract {
    nos: NestedOptionalStruct;

    init() {
        self.nos = NestedOptionalStruct{
            foo: null,
            bar: true,
            baz: null,
        };
    }
}