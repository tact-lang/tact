struct OptionalStruct {
    foo: Int;
    bar: Bool;
    comment: String;
}

contract TestContract {
    maybeData: OptionalStruct?;

    init() {
        self.maybeData = null;
    }
}