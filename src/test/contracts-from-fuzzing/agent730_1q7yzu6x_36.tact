struct XY {
    x: Int as uint8;
    y: Int as uint8;
}

contract EdgeSerialization {
    point: XY;

    init() {
        self.point = XY{ x:255, y:255 };
    }
}
