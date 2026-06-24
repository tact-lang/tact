struct NestedPoint {
    x: Int as int64;
    y: Int as int64;
    z: Int as int64;
}

contract TestContract {
    pos: NestedPoint;

    init() {
        self.pos = NestedPoint{
            x: 1,
            y: 2,
            z: 3,
        };
    }
}