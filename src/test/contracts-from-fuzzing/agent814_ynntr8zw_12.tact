struct MultiOptional {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalFields {
    data: MultiOptional;

    init() {
        self.data = MultiOptional{
            a: null,
            b: null,
            s: null,
        };
    }
}