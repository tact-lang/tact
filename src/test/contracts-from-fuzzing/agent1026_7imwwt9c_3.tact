struct Inner {
    x: Int;
    y: Int?;
}

contract TestContract {
    pos: Inner;

    init() {
        self.pos = Inner{
            x: 42,
            y: null
        };
    }
}