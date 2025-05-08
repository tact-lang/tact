contract OptionalPersistenceAssign {
    x: Int?;

    init() {
        self.x = null;
        self.x = 5;
        self.x = null;
    }
}