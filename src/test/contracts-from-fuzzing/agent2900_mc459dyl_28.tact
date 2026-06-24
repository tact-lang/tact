struct Inner {
    z: Int = 42;
}

struct Mid {
    m: Inner? = null;
}

contract OptionalWithDefaults {
    st: Mid? = null;

    init() {
        self.st = null;
    }
}
