struct MultipleOptionals {
    opt1: Int?;
    opt2: String?;
    opt3: Bool?;
    opt4: Slice?;
}

contract MultipleOptionalsTest {
    data: MultipleOptionals;

    init() {
        self.data = MultipleOptionals {
            opt1: null,
            opt2: null,
            opt3: true,
            opt4: null
        };
    }
}