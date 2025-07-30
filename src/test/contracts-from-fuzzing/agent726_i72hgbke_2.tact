struct InnerStruct {
    a: Int;
    b: Bool?;
    c: String;
}

contract NestedTest {
    inner: InnerStruct;

    init() {
        self.inner = InnerStruct{
            a: 7,
            c: "hello",
        };
    }

    receive() {
        self.inner = InnerStruct{
            a: self.inner.a + 1,
            c: self.inner.c,
        };
    }
}