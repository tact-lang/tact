contract BoolPersistence {
    on: Bool;
    off: Bool;

    init() {
        self.on = true;
        self.off = false;
    }
}