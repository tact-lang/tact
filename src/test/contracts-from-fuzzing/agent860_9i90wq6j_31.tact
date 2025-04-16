struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    a: Int;
    inner: Inner;
}

contract FieldOrdering {
    f: Outer;

    init() {
        self.f = Outer{a:10, inner: Inner{x:1,y:true}};
    }
}