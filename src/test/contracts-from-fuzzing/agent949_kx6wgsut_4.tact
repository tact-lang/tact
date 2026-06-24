struct NestedOptional {
    inner: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    value: Int;
}

contract NestedOptionalTest {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            inner: InnerStruct{
                flag: false,
                value: 100
            }
        };
    }
}
