struct NestedOptional {
    foo: Int?;
    bar: Bool?;
    inner: InnerStruct?;
}

struct InnerStruct {
    value: Int;
    flag: Bool;
}

contract Test {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            foo: null,
            bar: true,
            inner: null,
        };
    }
}