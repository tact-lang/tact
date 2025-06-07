struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    optVal: OptionalStruct?;

    init() {
        self.optVal = OptionalStruct { foo: 7, bar: true };
    }
}