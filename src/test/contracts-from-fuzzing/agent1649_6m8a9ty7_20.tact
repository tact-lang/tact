struct InnerMost {
    x: Int;
}

struct Mid {
    inner: InnerMost?;
}

contract TestContract {
    data: Mid;

    init() {
        self.data = Mid{
            inner: null,
        };
    }
}