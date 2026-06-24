struct OptOpt {
    maybeInt: Int?;
}

contract TestContract {
    foo: OptOpt?;
    init() {
        self.foo = OptOpt{ maybeInt: 123 };
    }
}