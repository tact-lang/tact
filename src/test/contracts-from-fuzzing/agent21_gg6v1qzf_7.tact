struct Leaf {
    n: Int;
}

struct Inner {
    maybeLeaf: Leaf?;
}

struct Outer {
    inner: Inner;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                maybeLeaf: Leaf{ n: 100 }
            }
        };
    }
}