struct Inner {
    foo: Int;
}

struct Outer {
    inner: Inner?;
    optInt: Int?;
}

contract OptInNestedOpt {
    data: Outer?;
    init() {
        self.data = null;
    }
    receive() {
        self.data = Outer{ inner: Inner{ foo: 77 }, optInt: 88 };
    }
}