struct OptionalInnerStruct {
    inner: Inner?;
}

struct Inner {
    deep: Int?;
}

contract Test {
    data: OptionalInnerStruct;

    init() {
        self.data = OptionalInnerStruct{
            inner: Inner{
                deep: null
            }
        };
    }
}