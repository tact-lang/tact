struct Inner {
    x: Int;
    y: Bool;
}

contract OptionalStructRef {
    innerOpt: Inner?;
    init() {
        self.innerOpt = Inner{ x: 5, y: false };
    }
}