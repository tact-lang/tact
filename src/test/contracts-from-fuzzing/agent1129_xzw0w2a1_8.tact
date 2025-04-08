struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract OptionalStructInStorage {
    maybeStruct: OptionalStruct?;

    init() {
        self.maybeStruct = null;
    }
}