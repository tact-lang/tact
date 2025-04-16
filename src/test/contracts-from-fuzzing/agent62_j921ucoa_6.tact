struct OptionalInner {
    value: Int?;
}

struct DeepOptional {
    inner: OptionalInner;
}

contract TestDeepOptional {
    receive() {
        let d = DeepOptional { inner: OptionalInner { value: 42 } };
        d.inner.value;
    }
}
