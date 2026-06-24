struct Inner {
    s: String?;
    b: Bool?;
}

struct Middle {
    inner: Inner?;
}

contract OptDeep {
    m: Middle?;

    init() {
        self.m = null;
    }
}