struct OptionalNestedStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    name: String;
    amount: Int;
}

contract OptionalNestedContract {
    data: OptionalNestedStruct;
    init() {
        self.data = OptionalNestedStruct{
            inner: InnerStruct{
                name: "val",
                amount: 123
            }
        };
    }
}
