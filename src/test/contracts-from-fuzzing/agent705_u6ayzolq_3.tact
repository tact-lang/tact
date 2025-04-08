struct OptionalFields {
    o1: Int?;
    o2: Bool?;
}

contract UsesOptionals {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            o1: null,
            o2: true,
        };
    }
}
