struct Inner {
    x: Int;
    y: Bool;
}

contract OptionalStructComplex {
    opt: Inner?;

    init() {
        self.opt = Inner{ x: 1, y: true };
    }
}