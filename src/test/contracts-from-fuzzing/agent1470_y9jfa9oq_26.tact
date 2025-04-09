struct NullableOptions {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract NullableFields {
    field: NullableOptions;

    init() {
        self.field = NullableOptions{
            s: null,
            b: null,
            i: null,
        };
    }
}