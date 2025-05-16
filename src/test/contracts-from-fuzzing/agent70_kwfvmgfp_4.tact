struct Inner {
    flag: Bool;
}

struct Wrapper {
    maybeInner: Inner?;
}

contract TestContract {
    nestedOptionalField: Wrapper;

    init() {
        self.nestedOptionalField = Wrapper{ maybeInner: null };
    }

    receive() {
        self.nestedOptionalField = Wrapper{ maybeInner: Inner{ flag: true } };
    }
}