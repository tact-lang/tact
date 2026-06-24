struct Deep {
    nested: Inner;
}

struct Inner {
    flag: Bool;
}

contract Test {
    val: Deep;
    init() {
        self.val = Deep{ nested: Inner{ flag: true } };
    }
}