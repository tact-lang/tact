struct InnerDefaults {
    i: Int = 7;
    b: Bool = false;
}

contract OptionalWithDefaults {
    data: InnerDefaults?;

    init() {
        self.data = null;
    }
}
