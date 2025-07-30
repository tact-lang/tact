struct SeqWithDefault {
    a: Int = 5;
    b: Int = 6;
    c: Int = 7;
}

contract InitDefaults {
    data: SeqWithDefault;

    init() {
        self.data = SeqWithDefault{};
    }
}