struct NestedInner {
    a: Bool;
    b: String;
}

struct NestedOuter {
    inner: NestedInner;
    c: Int;
    d: String;
}

contract Foo {
    x: NestedOuter;
    
    init() {
        self.x = NestedOuter{
            inner: NestedInner { a: true, b: "abc" },
            c: 42,
            d: "hello"
        };
    }
    receive() {}
}