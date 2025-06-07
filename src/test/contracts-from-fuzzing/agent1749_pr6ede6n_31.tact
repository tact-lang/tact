struct TwoStructs { a: Point; b: Point; }

struct Point { x: Int; y: Int; }

contract InitNestedDefault {
    s: TwoStructs;
    init() {
        self.s = TwoStructs{
            a: Point{ x: 1, y: 2 },
            b: Point{ x: 3, y: 4 }
        };
    }
}