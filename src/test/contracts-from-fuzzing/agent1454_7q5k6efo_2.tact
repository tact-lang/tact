struct NestedStruct {
    a: Int;
    b: Bool;
    inner: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract NestedTest {
    storage: NestedStruct;

    init() {
        self.storage = NestedStruct{
            a: 10,
            b: true,
            inner: InnerStruct{x: 5, y: false}
        };
    }

    receive() {
        let _ = self.storage.inner.x;
    }
}