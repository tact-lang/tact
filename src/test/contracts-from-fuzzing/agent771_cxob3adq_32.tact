struct Point { x: Int; y: Int; }
struct Line { a: Point; b: Point; }

contract NestedTwice {
    l: Line = Line{ a: Point{ x:1,y:2 }, b: Point{ x:3,y:4 } };

    init() {
        self.l = Line{ a: Point{ x:5,y:6 }, b: Point{ x:7,y:8 } };
    }
}