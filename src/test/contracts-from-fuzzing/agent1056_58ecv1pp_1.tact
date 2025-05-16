struct NestedOptionals {
    foo: Int?;
    bar: Bool?;
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Int?;
    flag: Bool;
}

contract EdgeCaseContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            foo: null,
            bar: true,
            inner: InnerStruct{
                x: 10,
                y: null,
                flag: false,
            },
        };
    }
}
