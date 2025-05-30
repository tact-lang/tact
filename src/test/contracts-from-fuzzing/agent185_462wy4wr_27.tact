struct NullableFields {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalInit {
    data: NullableFields;

    init() {
        self.data = NullableFields{
            i: 13,
            b: null,
            s: "Hi"
        };
    }
}