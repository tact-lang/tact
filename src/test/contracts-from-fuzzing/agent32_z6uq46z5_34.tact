struct Basic {
    id: Int;
}

struct Wrapper {
    inner: Basic?;
}

contract OptionalStructHolding {
    w: Wrapper;

    init() {
        self.w = Wrapper{ inner: null };
    }
}
