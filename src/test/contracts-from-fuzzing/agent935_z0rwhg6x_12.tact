struct Point {
    x: Int;
    y: Int;
}

contract TestContract {
    pos: Point?;

    init() {
        self.pos = null;
    }
}