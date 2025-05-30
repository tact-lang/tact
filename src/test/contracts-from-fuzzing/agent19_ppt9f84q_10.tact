struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner;
}

contract TestNested {
    receive() {}
    
    get fun getNested(): Outer {
        return Outer { inner: Inner { x: 99 } };
    }
}
