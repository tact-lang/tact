struct OptionalStruct {
    maybeNum: Int?;
    maybeBool: Bool?;
}

contract OptionalStorage {
    optData: OptionalStruct;

    init() {
        self.optData = OptionalStruct{
            maybeNum: null,
            maybeBool: true,
        };
    }
}