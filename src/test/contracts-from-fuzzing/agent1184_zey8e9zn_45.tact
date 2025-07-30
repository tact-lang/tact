struct Comp {
    x: Int;
    y: Bool;
}

contract ExplicitSetOpt {
    inner: Comp?;

    init() {
        self.inner = Comp{ x: 5, y: true };
    }
}