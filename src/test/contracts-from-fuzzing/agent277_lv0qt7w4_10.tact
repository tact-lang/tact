struct Point { x: Int; y: Int; }
struct Shape { p1: Point; p2: Point; label: String; flag: Bool; }

contract Test {
    s: Shape;
    init() {
        self.s = Shape{
            p1: Point{ x: 1, y: 2 },
            p2: Point{ x: 3, y: 4 },
            label: "rect",
            flag: true
        };
    }
}