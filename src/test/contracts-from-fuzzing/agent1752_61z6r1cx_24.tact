contract ConflictOptionalAndDefault {
    x: Int? = null;
    y: Bool? = null;

    init() {
        self.x = 42;
        self.y = true;
    }
}