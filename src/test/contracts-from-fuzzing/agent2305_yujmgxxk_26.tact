contract DefaultOptional {
    x: Int?;
    y: Int? = null;

    init() {
        self.x = null;
    }
}
