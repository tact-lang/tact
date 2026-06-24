struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    foo: InnerOpt?;

    init() {
        self.foo = InnerOpt{ x: 42, y: null };
    }
}