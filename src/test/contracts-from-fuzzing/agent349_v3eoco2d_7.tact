contract TestContract {
    pointOpt: Point?;

    init() {
        self.pointOpt = null;
    }
}

struct Point {
    x: Int;
    y: Int;
}