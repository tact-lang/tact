struct Inner {
    x: Int;
    y: Bool;
}

contract Test2 {
    point: Inner;
    init() {
        self.point = Inner{
            x: 100,
            y: false,
        };
    }
}