struct SerOpt {
    text: String?;
}

contract OptionalStructWithOptionalField {
    data: SerOpt?;

    init() {
        self.data = SerOpt{
            text: null
        };
    }
}