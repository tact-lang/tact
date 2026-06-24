struct Compose {
    a: Int;
    b: Bool;
}

struct Wrap {
    inner: Compose;
}

struct OuterMost {
    w: Wrap;
}

contract TripleNest {
    val: OuterMost;

    init() {
        self.val = OuterMost{w: Wrap{inner: Compose{a:1, b:true}}};
    }
}