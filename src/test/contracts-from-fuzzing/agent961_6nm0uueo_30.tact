struct WithOptionalInnerStruct {
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalInnerStructContract {
    data: WithOptionalInnerStruct;

    init() {
        self.data = WithOptionalInnerStruct { inner: null };
    }
}