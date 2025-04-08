contract NullAssignNoDefaults {
    x: Int?;

    init() {
        self.x = null; // assign null explicitly
    }
}
