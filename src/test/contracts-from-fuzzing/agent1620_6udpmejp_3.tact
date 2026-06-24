struct OptionalInner {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

contract OptionalStructFields {
    s: OptionalInner;

    init() {
        self.s = OptionalInner{
            f1: null,
            f2: true,
            f3: null,
        };
    }
}