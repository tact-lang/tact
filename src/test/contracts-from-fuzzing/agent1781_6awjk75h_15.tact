contract BigOptionalChain {
    s: Outer?;

    init() {
        self.s = null;
    }
}

struct Outer {
    inner: Middle?;
    id: Int;
}

struct Middle {
    leaf: Leaf?;
    flag: Bool;
}

struct Leaf {
    val: Int;
}