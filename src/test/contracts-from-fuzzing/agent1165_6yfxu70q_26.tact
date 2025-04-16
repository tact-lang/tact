struct CoordX { x: Int; }
struct CoordY { y: Int; }

struct PointXY {
    x: CoordX;
    y: CoordY;
}

contract SeparatePoint {
    p: PointXY;
    init() {
        self.p = PointXY{ x: CoordX{ x: 1 }, y: CoordY{ y: 2 } };
    }
}
