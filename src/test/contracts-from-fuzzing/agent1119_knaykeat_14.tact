struct Inner {
    x: Int;
}

struct Middle {
    inner: Inner?;
}

struct Outer {
    middle: Middle?;
}

contract OptDeepStorage {
    data: Outer?;

    init() {
        self.data = null;
    }
}