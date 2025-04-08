struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    s: Inner;

    init() {
        self.s = Inner{
            x: 10,
            y: true,
        };
    }
}
