struct OptStruct {
    foo: Int;
}

contract TestContract {
    maybe: OptStruct?;

    init() {
        self.maybe = OptStruct{ foo: 7 };
    }
}
