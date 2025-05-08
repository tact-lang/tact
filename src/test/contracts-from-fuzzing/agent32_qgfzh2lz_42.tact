contract OptionalZero {
    x: Int?;
    init() {
        self.x = 0;   // assign zero to optional
        self.x = null;
    }
}
