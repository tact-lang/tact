struct Deep {
    inner: Inner;
    flag: Bool;
}

struct Inner {
    leaf: Leaf;
}

struct Leaf {
    x: Int;
}

contract Test {
    s: Deep;
    init() {
        self.s = Deep{inner:Inner{leaf:Leaf{x:999}}, flag:true};
    }
}