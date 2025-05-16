struct Inner {
    x: Int;
    y: Int;
}

contract NestedStructs {
    a: Inner;
    b: Inner;

    init() {
        self.a = Inner{x: 1, y: 2};
        self.b = Inner{x: 3, y: 4};
    }
}