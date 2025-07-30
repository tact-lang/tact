struct OptionalFields {
    x: Int?;
    y: Int?;
    flag: Bool?;
    text: String?;
}

contract OptionalStorage {
    opt: OptionalFields;

    init() {
        self.opt = OptionalFields{
            x: null,
            y: null,
            flag: null,
            text: null,
        };
    }
}