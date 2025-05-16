struct InnerStruct {
    a: Int;
    b: Int;
}

struct OuterStruct {
    inner: InnerStruct;
    x: Int;
}

contract NestedStructTest {
    receive() {
        let s = OuterStruct{
            inner: InnerStruct{ a: 10, b: 20 },
            x: 5,
        };
        let sum = s.inner.a + s.inner.b + s.x;
    }
}
