struct Point {
    x: Int;
    y: Int;
}

contract OptionalStructField {
    p: Point?;

    init() {
        self.p = null;
    }
}