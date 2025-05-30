struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    point: Inner;

    init() {
        self.point = Inner{a: 1, b: true};
    }
}