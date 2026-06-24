contract OptionalAndDefaultFields {
    x: Int = 5;
    y: Bool?;

    init() {
        self.y = null;
    }
}