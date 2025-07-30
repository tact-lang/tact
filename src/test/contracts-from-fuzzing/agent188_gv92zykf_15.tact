struct NestedNestedOptional {
    inner: InnerStruct?;
}

struct InnerStruct {
    value: Int?;
}

contract NestedNestedOpt {
    data: NestedNestedOptional;
    init() {
        self.data = NestedNestedOptional{
            inner: InnerStruct{
                value: 123
            }
        };
    }
}
