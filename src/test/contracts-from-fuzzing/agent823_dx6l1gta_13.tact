struct Deepest {
    x: Int = 11;
    y: String = "Deep";
}

struct Deeper {
    d: Deepest = Deepest{};
    flag: Bool = true;
}

struct Inner {
    val: Int = 42;
    deeper: Deeper = Deeper{};
}

contract InitDeepDefaults {

    inner: Inner;

    init() {
        self.inner = Inner{};
    }

    receive() {}
}