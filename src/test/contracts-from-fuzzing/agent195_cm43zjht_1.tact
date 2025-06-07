struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    x: Inner;

    init() {
        self.x = Inner{a: 1, b: true};
    }
}