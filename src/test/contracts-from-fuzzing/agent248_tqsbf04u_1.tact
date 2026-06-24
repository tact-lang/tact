struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    c: String;
}

contract StorageNestedTest {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{a:1, b:true},
            c: "hello"
        };
    }
}