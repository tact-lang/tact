struct Inner {
    a: Int;
    b: Int;
}

struct Outer {
    inner: Inner;
    c: Int;
}

contract TestNestedStruct {
    receive() {
         // Instantiate a nested struct with an inner struct and an extra field
         let n = Outer { inner: Inner { a: 10, b: 20 }, c: 30 };
         dump(n.inner.a + n.c);
    }
}
