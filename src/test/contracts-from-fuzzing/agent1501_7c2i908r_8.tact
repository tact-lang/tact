struct PosOpt {
    x: Int?;
    y: Int?;
}

contract TestContract {
    foo: PosOpt?;

    init() {
        self.foo = PosOpt{ x: null, y: 42 };
    }
}