struct Mid {
    val: Int;
}

struct Wrapper {
    inner: Mid?;
}

contract OptionalMiddle {
    store: Wrapper;

    init() {
        self.store = Wrapper{
            inner: Mid{ val: 999 },
        };
    }
}