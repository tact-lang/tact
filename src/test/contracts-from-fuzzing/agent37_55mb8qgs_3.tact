struct MultipleOptionals {
    opt1: Int?;
    opt2: String?;
    opt3: Bool?;
    opt4: Address?;
    opt5: Cell?;
}

contract OptionalFields {
    state: MultipleOptionals;

    init() {
        self.state = MultipleOptionals{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
            opt5: null,
        };
    }
}
