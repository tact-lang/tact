struct AllOptionals {
    ia: Int?;
    ib: Int?;
    ic: Int?;
    ba: Bool?;
    bb: Bool?;
}

contract OptionalFields {
    data: AllOptionals;

    init() {
        self.data = AllOptionals {
            ia: null,
            ib: 0,
            ic: -1,
            ba: true,
            bb: null,
        };
    }
}