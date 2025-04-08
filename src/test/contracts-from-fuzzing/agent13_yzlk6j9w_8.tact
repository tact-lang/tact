struct Point { x: Int; y: Int }

struct Box {
    p1: Point;
    p2: Point;
    p3: Point;
}

struct Container {
    bx1: Box;
    bx2: Box;
}

contract NestedDefaults {
    cont: Container = Container{
        bx1: Box{
            p1: Point{ x:1, y:1 },
            p2: Point{ x:2, y:2 },
            p3: Point{ x:3, y:3 }
        },
        bx2: Box{
            p1: Point{ x:4, y:4 },
            p2: Point{ x:5, y:5 },
            p3: Point{ x:6, y:6 }
        }
    };
}