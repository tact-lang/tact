struct Point { x: Int; y: Int }

contract MixedFields {
    a: Int = 1;
    b: Bool = false;
    c: Int?;
    d: Bool?;
    e: String = "x";
    f: Slice;
    g: Cell;
    pt: Point;

    init() {
        self.c = null;
        self.d = true;
        self.f = emptyCell().asSlice();
        self.g = emptyCell();
        self.pt = Point{ x: 10, y: 20 };
    }
}