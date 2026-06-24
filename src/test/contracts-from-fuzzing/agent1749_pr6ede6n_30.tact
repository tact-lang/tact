struct Point { x: Int; y: Int; }

contract ConstStructField {
    const ORIGIN: Point = Point{ x: 0, y: 0 };

    get fun originX(): Int {
        return self.ORIGIN.x;
    }
}