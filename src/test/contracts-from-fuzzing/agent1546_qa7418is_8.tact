struct OptionalStruct {
    a: Int;
    b: Bool;
}

contract OptionalStructContract {
    optStruct: OptionalStruct?;

    init() {
        self.optStruct = null;
    }
}
