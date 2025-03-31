struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner;
}

contract TestGetterNested {
    outer: Outer = Outer{inner: Inner { x: 123 } };

    receive() {}

    get fun getOuter(): Outer {
         return self.outer;
    }
}
