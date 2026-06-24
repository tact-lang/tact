struct Point { x:Int; y:Int; }
struct Line { p1:Point; p2:Point; }
struct Shape { l1:Line; l2:Line; }

contract ShapesTest {
    s: Shape;
    init() {
        self.s = Shape{
            l1: Line{ p1:Point{ x:0,y:0 }, p2:Point{ x:1,y:1 } },
            l2: Line{ p1:Point{ x:2,y:2 }, p2:Point{ x:3,y:3 } }
        };
    }
}