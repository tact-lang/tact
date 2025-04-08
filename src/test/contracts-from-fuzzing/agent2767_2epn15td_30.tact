contract SerializeMismatch {
    big: Int as uint4;

    init() {
        self.big = 12345; // intentionally large value versus uint4 (0-15)
    }
}