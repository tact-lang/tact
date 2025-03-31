struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
}

contract TestNested {
    receive() {}

    get fun getNested(): Outer {
         return Outer { inner: Inner { a: 999 } };
    }
}
