contract OptionalFieldWeirdInit {
    field: Int?;

    init() {
        self.field = null;
        self.field = 999;
        self.field = null;
    }
}