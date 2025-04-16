struct OptionalStruct {
    x: Int?;
    y: Bool?;
}

contract OptionalStructContract {
    optData: OptionalStruct;

    init() {
        self.optData = OptionalStruct{ x: null, y: true };
    }
}