struct One {
    a: Int;
}
struct Two {
    b: Int;
}
struct Three {
    c: Int;
}

contract OptWrap {
    foo: One?;
    bar: Two?;
    baz: Three?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
    }
}