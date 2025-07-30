struct MultipleOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalMultiple {
    data: MultipleOptionals;

    init() {
        self.data = MultipleOptionals {
            a: null,
            b: null,
            c: null
        };
    }
}