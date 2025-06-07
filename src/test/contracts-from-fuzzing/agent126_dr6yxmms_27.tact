struct Inner {
    num: Int;
}

struct Middle {
    inner: Inner;
}

struct OuterMost {
    middle: Middle;
}

contract DeepAssignNull {
    deep: OuterMost?;

    init() {
        self.deep = null;
    }
}