struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    optfield: OptionalStruct?;

    init() {
        self.optfield = null;
    }
}