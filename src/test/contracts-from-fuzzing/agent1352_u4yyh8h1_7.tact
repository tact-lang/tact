struct InnerMost {
    value: Int?;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    middle: Middle;
}

contract TestContract {
    config: Outer;

    init() {
        self.config = Outer{ middle: Middle{ inner: InnerMost{ value: null } } };
    }
}
