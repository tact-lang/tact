struct InnerStruct {
    value: Int as int256;
}

struct OuterStruct {
    inner: InnerStruct;
    extra: Int as int256;
}

contract Test {
    receive() {
        let o = OuterStruct{
            inner: InnerStruct{ value: 123 },
            extra: 456
        };
        let v = o.inner.value;
    }
}
