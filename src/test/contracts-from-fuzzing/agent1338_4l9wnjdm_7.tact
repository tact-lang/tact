struct OptionalInt {
    value: Int?;
}

contract OptionalStructInField {
    data: OptionalInt;

    init() {
        self.data = OptionalInt{ value: null };
    }
}