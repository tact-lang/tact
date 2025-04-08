struct MultiOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
}

contract OptionalTest {
    values: MultiOptionals;
    init() {
        self.values = MultiOptionals{ opt1: null, opt2: true, opt3: null };
    }
}