struct OptionalStruct {
    val: Int;
}

contract OptionalContract {
    optStruct: OptionalStruct?;

    init() {
        self.optStruct = null;
    }
}