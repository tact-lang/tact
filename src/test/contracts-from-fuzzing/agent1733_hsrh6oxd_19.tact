struct OptionalWrap {
    content: Int?;
}

contract TestContract {
    field: OptionalWrap;

    init() {
        self.field = OptionalWrap{ content: null };
    }
}