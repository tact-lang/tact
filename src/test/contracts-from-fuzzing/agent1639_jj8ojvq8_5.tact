struct Optionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract AllOptionalFields {
    data: Optionals;

    init() {
        self.data = Optionals{
            a: null,
            b: true,
            c: null,
        };
    }
}
