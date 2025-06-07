struct Inner {
    x: Int;
    y: Bool;
}

contract Test {
    innerField: Inner;

    init() {
        self.innerField = Inner{x: 12, y: true};
    }
}
