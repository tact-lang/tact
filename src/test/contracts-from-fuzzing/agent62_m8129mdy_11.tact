struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    msg: String;
}

contract GetterTestNested {
    o: Outer = Outer { inner: Inner { a: 10, b: true }, msg: "hello" };

    receive() {}

    get fun getNested(): Outer {
         return self.o;
    }
}
