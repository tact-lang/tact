struct OptionalStruct {
    foo: Int;
}

contract TestContract {
    maybeStruct: OptionalStruct?;

    init() {
        self.maybeStruct = OptionalStruct{ foo: 10 };
    }
}