contract EmptyOptionalStruct {
    point: Point?;

    init() {
        self.point = null;
    }
}

struct Point {
    x: Int;
    y: Int;
}
