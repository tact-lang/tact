struct Inner {
    d: Int?;
}

struct Mid {
    inner: Inner?;
}

struct Outer {
    mid: Mid?;
}

contract Test {
    data: Outer?;

    init() {
        self.data = null;
    }

    receive() {}
}