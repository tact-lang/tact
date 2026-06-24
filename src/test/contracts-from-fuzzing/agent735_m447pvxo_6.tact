struct OptNested {
    n: Int?;
    s: String?;
    b: Bool?;
}

contract OptionalFields {
    data: OptNested;

    init() {
        self.data = OptNested{
            n: null,
            s: null,
            b: null
        };
    }
}