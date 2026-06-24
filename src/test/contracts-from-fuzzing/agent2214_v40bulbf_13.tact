struct Inner {
    msg: String?;
    b: Bool;
}

struct Middle {
    inner: Inner?;
    a: Int;
}

contract OptNestedOpt {
    val: Middle?;

    init() {
        self.val = null;
    }
}