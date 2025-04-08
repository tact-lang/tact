contract OptionalStructField {
    s: Point?;

    init() {
        self.s = null;
    }
}

struct Point {
    x: Int;
    y: Int;
}
