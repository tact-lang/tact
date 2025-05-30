struct OptionalStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalFieldsContract {
    opt: OptionalStruct;

    init() {
        self.opt = OptionalStruct{
            x: null,
            y: true,
            z: null,
        };
    }
}