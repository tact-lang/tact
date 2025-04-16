struct OptionalNestedStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    deep: Int?;
}

contract OptNestedStructContract {
    val: OptionalNestedStruct;

    init() {
        self.val = OptionalNestedStruct{
            inner: InnerStruct{
                deep: null
            }
        };
    }
}