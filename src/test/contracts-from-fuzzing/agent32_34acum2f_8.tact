struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner;
}

contract Test {
    receive() {}

    get fun getOuter(): Outer {
         return Outer{inner: Inner{x: 123}};
    }
}
