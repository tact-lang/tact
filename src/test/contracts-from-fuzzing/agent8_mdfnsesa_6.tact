struct Inner {
    val: Int;
}

struct Outer {
    inner: Inner;
    y: Int;
}

contract TestNested {
    receive() {
         let o: Outer = Outer { inner: Inner { val: 42 }, y: 100 };
         o.inner.val;
    }
}
