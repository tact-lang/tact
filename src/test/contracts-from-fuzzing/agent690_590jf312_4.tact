struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    val: OptionalFields;

    init() {
        self.val = OptionalFields{
            a: null,
            b: true,
            c: null
        };
    }
}