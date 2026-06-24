struct OptionalStr {
    text: String?;
}

contract OptionalStrField {
    f: OptionalStr?;

    init() {
        self.f = OptionalStr{ text: null };
    }
}
