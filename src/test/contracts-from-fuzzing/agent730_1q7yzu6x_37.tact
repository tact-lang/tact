struct XY {
    x: Int as uint8;
    y: Int as uint8;
}

contract OverflowSerialization {
    point: XY;

    init() {
        self.point = XY{ x:256, y:0 };
    }
}
