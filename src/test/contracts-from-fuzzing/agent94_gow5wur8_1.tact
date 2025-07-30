struct Inner {
    x: Int;
    y: Int?;
}

contract Test {
    pos: Inner;

    init() {
        self.pos = Inner{
            x: 1,
            y: null,
        };
    }
}