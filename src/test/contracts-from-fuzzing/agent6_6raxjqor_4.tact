struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
    x: Int;
}

contract NestedStructTest {
    receive() {
         let nested: Outer = Outer { inner: Inner { a: 42 }, x: 100 };
         dump(nested.inner.a + nested.x);
    }
}
