struct Inner {
    val: Int?;
}

struct Middle {
    inner: Inner?;
}

struct Outer {
    middle: Middle?;
}

contract Test {
    store: Outer;

    init() {
        self.store = Outer{ middle: null };
    }
}