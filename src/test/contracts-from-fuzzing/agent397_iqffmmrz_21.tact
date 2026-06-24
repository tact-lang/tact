struct Wrapping {
    inner: Inner;
}

struct Inner {
    value: Int?;
}

contract TestContract {
    w: Wrapping;

    init() {
        self.w = Wrapping{ inner: Inner{ value: null } };
    }
}