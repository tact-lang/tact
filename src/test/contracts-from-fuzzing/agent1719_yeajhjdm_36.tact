struct NestedTwice {
    a: Int;
    b: NestedInner;
}

struct NestedInner {
    c: Int;
    d: Bool;
}

contract CombNested {
    v: NestedTwice;

    init() {
        self.v = NestedTwice{
            a:1,
            b: NestedInner{c:2,d:false}
        };
    }
}