struct Point {
    x: Int;
    y: Int;
}

contract OptNested {
    pt: Point?;

    init() {
        self.pt = null;
    }
}