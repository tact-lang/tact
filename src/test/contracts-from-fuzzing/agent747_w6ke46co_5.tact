contract TestContract {
    optStruct: OptionalStruct?;

    init() {
        self.optStruct = null;
    }
}

struct OptionalStruct {
    a: Int;
    b: Bool;
}
