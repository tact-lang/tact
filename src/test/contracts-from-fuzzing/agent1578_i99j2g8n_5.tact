struct OptionalStruct {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    optStruct: OptionalStruct;

    init() {
        self.optStruct = OptionalStruct{ x: null, y: true };
    }
}