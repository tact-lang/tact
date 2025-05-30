struct SubInner {
    val: Int;
}

struct Inner {
    a: Int;
    b: Bool;
    sub: SubInner;
}

struct Parent {
    x: Int;
    nested: Inner;
}

contract NestedComplex {
    data: Parent;

    init() {
        self.data = Parent{
            x: 7,
            nested: Inner{ a: 1, b: false, sub: SubInner{val: 99} }
        };
    }
}