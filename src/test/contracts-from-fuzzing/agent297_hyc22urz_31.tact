struct InnerOpt {
    x: Int?;
}

contract TestContract {
    foo: InnerOpt?;

    init() {
        self.foo = null;
    }
}