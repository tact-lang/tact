struct Point {
    x: Int;
    y: Int;
}

contract OptOptDirect {
    p: Point?;
    optint: Int?;
    init() {
        self.p = null;
        self.optint = null;
    }
}