struct V {
    a: Int;
    b: Bool;
}

struct W {
    c: Int;
    d: Bool;

    nested: V;
}

contract MultipleStructs {
    inner: V;
    other: W;

    init() {
        self.inner = V{a:1, b:true};
        self.other = W{c:2, d:false, nested: V{a:3,b:true}};
    }

    receive() {
        self.inner.a = self.inner.a + 1;
        self.other.nested.b = !self.other.nested.b;
    }
}