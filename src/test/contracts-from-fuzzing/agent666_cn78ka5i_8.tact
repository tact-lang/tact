struct Point {
    x: Int;
    y: Int;
}

contract OptStructField {
    coord: Point?;

    init() {
        self.coord = null;
    }
}
