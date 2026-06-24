struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
    b: Bool;
}

contract TestNested {
    inner: Int = 20;
    
    receive() {}

    get fun getOuter(): Outer {
        return Outer{inner: Inner{a: self.inner}, b: true};
    }
}
