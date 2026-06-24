struct Point {
    x: Int;
    y: Int;
}

contract OptionalPoints {
    opt1: Point?;
    opt2: Point?;

    init() {
        self.opt1 = null;
        self.opt2 = null;
    }
}