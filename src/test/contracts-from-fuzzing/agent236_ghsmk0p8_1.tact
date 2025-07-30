struct NestedOptionalStruct {
    value: Int?;
    inner: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    description: String;
}

contract TestContract {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{
            value: null,
            inner: null,
        };
    }
}