struct Point { x: Int; y: Int; }
struct Rect { tl: Point; br: Point; }

contract MultiNested {
    shape: Rect;

    init() {
        self.shape = Rect{
            tl: Point{ x:0, y:1 },
            br: Point{ x:2, y:3 }
        };
    }
}