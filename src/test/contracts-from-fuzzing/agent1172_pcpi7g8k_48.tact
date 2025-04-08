contract PersistentOptional {
    i: Int?;
    b: Bool?;

    init() {
        self.i = null;
        self.b = true;
    }
}