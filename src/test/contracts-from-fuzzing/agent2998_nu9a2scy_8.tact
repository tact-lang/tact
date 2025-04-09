struct OptionalStruct {
    x: Int?;
    y: Bool?;
    z: String?;
    w: Address?;
}

contract OptionalStructContract {
    field: OptionalStruct;
    init() {
        self.field = OptionalStruct{
            x: null,
            y: null,
            z: null,
            w: null,
        };
    }
}