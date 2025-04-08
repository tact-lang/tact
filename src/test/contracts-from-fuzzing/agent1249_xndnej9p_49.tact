struct Inner {
    a: Int;
}

struct Middle {
    b: Inner;
}

contract TwoLevelOptional {
    mid: Middle?;

    init() {
        self.mid = null;
    }
}