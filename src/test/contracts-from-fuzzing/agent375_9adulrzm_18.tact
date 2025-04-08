struct Outer {
    a: Int;
    nested: Inner;
}

struct Inner {
    b: Int;
    nested_deep: Deepest;
}

struct Deepest {
    c: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            a:1,
            nested: Inner{b:2, nested_deep: Deepest{c:3}}
        };
    }
}
