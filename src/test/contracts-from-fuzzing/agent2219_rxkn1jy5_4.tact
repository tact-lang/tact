struct OptionalInner {
    data: String?;
}

contract OptionalField {
    f: OptionalInner;

    init() {
        self.f = OptionalInner{ data: null };
    }
}