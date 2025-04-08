contract BoolFieldsOptional {
    x: Bool? = null;
    y: Bool?;

    init() {
        self.x = null;
        self.y = null;
    }
}
