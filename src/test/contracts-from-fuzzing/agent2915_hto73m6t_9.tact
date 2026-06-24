struct InnerMost {
    v: Int;
}

struct Mid {
    nested: InnerMost?;
}

contract TestContract {
    data: Mid;

    init() {
        self.data = Mid{ nested: null };
    }
}
