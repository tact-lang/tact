struct Point { x: Int; y: Int; txt: String; }

struct Shape {
    p1: Point;
    p2: Point;
    p3: Point;
    flag: Bool;
}

contract NestedSameStruct {
    s: Shape;

    init() {
        self.s = Shape{
            p1: Point{ x:1,y:2,txt:"a" },
            p2: Point{ x:3,y:4,txt:"b" },
            p3: Point{ x:5,y:6,txt:"c" },
            flag: true
        };
    }
}