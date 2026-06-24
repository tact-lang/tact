struct Point {
    x: Int;
    y: Int?;
    label: String;
}

contract Coord {
    pt: Point;
    
    init() {
        self.pt = Point{
            x: 1,
            y: null,
            label: "A",
        };
    }
}