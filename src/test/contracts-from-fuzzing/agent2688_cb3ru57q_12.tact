struct OptionalInside {
    s: String?;
    b: Bool?;
    a: Int?;
}

contract OptDefaults {
    data: OptionalInside;

    init() {
        self.data = OptionalInside{
            s: null,
            b: null,
            a: null
        };
    }
}