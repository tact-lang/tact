struct NestedOptInStruct {
    inner: Inner?;
}

struct Inner {
    maybe: Int?;
}

contract OptionalStructInStruct {
    payload: NestedOptInStruct;

    init() {
        self.payload = NestedOptInStruct{
            inner: Inner{maybe: null}
        };
    }
}
