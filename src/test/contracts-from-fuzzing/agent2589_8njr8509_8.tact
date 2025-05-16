struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct BigStruct {
    p1: Point;
    p2: Point;
    p3: Point;
    p4: Point;
    p5: Point;
}

contract SerializeSizes {
    big: BigStruct;

    init() {
        self.big = BigStruct {
            p1: Point{ x:1, y:2 },
            p2: Point{ x:3, y:4 },
            p3: Point{ x:5, y:6 },
            p4: Point{ x:7, y:8 },
            p5: Point{ x:9, y:10 },
        };
    }
}