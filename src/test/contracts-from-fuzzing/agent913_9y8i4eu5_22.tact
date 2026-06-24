struct Base {
    x: Int;
    y: Int;
}

struct Wrap {
    inner: Base?;
}

struct Top {
    wrap: Wrap?;
}

contract TestContract {
    state: Top;
    init() {
        self.state = Top{
            wrap: null
        };
    }
}