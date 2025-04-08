struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract SingleNestedOptional {
    optPoint: Point?;

    init() {
        self.optPoint = null;
    }
}