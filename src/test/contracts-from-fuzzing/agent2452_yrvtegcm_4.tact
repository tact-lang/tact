struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract NestedOptionals {
    maybePoint: Point? = null;

    init() {
        self.maybePoint = null;
    }
}