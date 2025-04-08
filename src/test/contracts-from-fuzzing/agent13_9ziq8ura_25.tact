struct Valid {
    x: Int?;
    y: Bool?;
}

contract OptionalStruct {
    field: Valid?;

    init() {
        self.field = null;
    }
}