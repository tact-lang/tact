contract OptionalDefaultMixed {
    x: Int? = null;
    y: Int?;

    init() {
        self.y = 5;
    }
}