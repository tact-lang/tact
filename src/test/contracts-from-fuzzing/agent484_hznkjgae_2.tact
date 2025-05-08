struct Inner {
    x: Int;
    y: Int?;
}

contract TestContract {
    point: Inner;

    init() {
        self.point = Inner{
            x: 10,
            y: null,
        };
    }
}