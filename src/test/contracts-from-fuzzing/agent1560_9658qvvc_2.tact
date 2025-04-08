struct InnerOpt {
    num: Int?;
    text: String?;
}

contract OptionalFields {
    field: InnerOpt;
    init() {
        self.field = InnerOpt{
            num: null,
            text: null,
        };
    }
}