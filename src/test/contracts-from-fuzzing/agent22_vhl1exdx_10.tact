struct Inner {
    i: Int;
}

struct Outer {
    inner: Inner;
}

contract TestGetterNested {
    x: Int = 99;

    receive() {}

    get fun getNested(): Outer {
         return Outer { inner: Inner { i: self.x } };
    }
}
