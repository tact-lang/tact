struct OptionalInner {
    value: Int?;
    flag: Bool?;
}

contract TestOptional {
    field: OptionalInner = OptionalInner{ value: null, flag: null };

    init() {
        self.field = OptionalInner{ value: 7, flag: true };
    }
}
