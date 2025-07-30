contract MultipleOptionals {
    ox: Int?;
    oy: Int?;

    init() {
        self.ox = null;
        self.oy = 123;
    }
}