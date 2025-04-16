struct OptionalFields {
    count: Int?;
    flag: Bool?;
    text: String?;
}

contract OptionalStructPersist {
    opt: OptionalFields;

    init() {
        self.opt = OptionalFields{
            count: null,
            flag: true,
            text: null,
        };
    }
}