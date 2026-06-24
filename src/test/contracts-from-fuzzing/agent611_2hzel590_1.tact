struct Inner {
    x: Int as int64;
    y: Int as int64;
}

contract NestedSingle {
    point: Inner;

    init() {
        self.point = Inner{
            x: 10,
            y: 20
        };
    }
}