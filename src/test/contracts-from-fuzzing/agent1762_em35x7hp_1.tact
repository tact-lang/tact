struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    pt: Inner;

    init() {
        self.pt = Inner{
            x: 5,
            y: true,
        };
    }
}