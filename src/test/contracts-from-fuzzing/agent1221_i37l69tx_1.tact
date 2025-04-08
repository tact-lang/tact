struct OptionalWrap {
    count: Int?;
    text: String?;
}

contract OptField {
    field: OptionalWrap;

    init() {
        self.field = OptionalWrap{ count: null, text: null };
    }
}