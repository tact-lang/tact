struct OptionalStruct {
    x: Int?;
    y: String?;
}

contract TestContract {
    optField: OptionalStruct;
    init() {
        self.optField = OptionalStruct{ x: null, y: null };
    }
}