struct Inner {
    val: Int;
}

struct WrappedInner {
    inner: Inner?;
}

contract OptionalInStruct {
    field: WrappedInner;

    init() {
        self.field = WrappedInner{ inner: null };
    }
}