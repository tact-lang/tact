struct OptionalStruct {
    a: Int;
}

contract Test {
    optStruct: OptionalStruct?;
    init() {
        self.optStruct = null;
    }
}