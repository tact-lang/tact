// Focus: optional struct of optional struct with inner optional primitive
struct Inner {
    x: Int?;
}

struct Middle {
    inner: Inner?;
}

contract OptOptOpt {
    val: Middle?;

    init() {
        self.val = null;
    }
}
