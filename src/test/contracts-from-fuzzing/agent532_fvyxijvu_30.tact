struct Point {
    x: Int;
    y: Int;
}

contract OptionalPointStorage {
    p: Point?;

    init() {
        self.p = null;
    }
}