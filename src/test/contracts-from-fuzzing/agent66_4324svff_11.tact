struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
}

contract Test {
    data: Outer = Outer{ inner: Inner{ a: 7, b: false } };

    receive() {}

    get fun getOuter(): Outer {
         return self.data;
    }
}
