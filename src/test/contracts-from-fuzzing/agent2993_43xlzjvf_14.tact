contract OptionalEmpty {
    f1: Int?;

    init() {
        self.f1 = null;
    }

    get fun f1_value(): Int? {
        return self.f1;
    }
}