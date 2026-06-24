struct OptionalStruct {
    foo: Int;
    bar: String;
}

contract TestContract {
    maybeData: OptionalStruct?;

    init() {
        self.maybeData = null;
    }

    receive() {}
}