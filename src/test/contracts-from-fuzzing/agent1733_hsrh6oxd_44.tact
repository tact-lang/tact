contract TypeCheck {
    x: Int as uint8;

    init() {
        self.x = -1;  // invalid per serialization (unsigned)
    }
}