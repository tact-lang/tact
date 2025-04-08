struct OptionalWrap {
    value: Int?;
}

contract OptionalStructStorage {
    data: OptionalWrap;

    init() {
        self.data = OptionalWrap{ value: null };
    }
}