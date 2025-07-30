contract NullableStructField {
    s: Data?;

    init() {
        self.s = null;
    }
}

struct Data {
    x: Int;
    y: Bool;
}
