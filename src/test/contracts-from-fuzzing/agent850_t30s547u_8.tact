struct SubInner {
    c: Int;
}

struct Inner {
    b: SubInner;
}

contract MultiLayerDegenerate {
    root: Inner?;

    init() {
        self.root = null;
    }
}