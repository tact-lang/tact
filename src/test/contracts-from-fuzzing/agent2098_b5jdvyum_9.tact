struct MultiOption {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract OptionalFields {
    field: MultiOption = MultiOption{x: null, y: null, s: null};
}
