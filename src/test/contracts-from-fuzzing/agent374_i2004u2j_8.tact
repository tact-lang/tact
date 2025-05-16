struct DefaultVals {
    foo: Int = 42;
    bar: Bool = true;
    str: String = "hello";
}

contract TestContract {
    dv: DefaultVals;

    init() {
        self.dv = DefaultVals{};
    }

    receive() {
        let _ = self.dv.foo;
    }
}