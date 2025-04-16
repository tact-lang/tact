struct NestedRest {
    p: Point;
    s: Slice as remaining;
}

struct Point {
    x: Int;
    y: Int;
}

contract RestDeep {
    val: NestedRest;

    init() {
        self.val = NestedRest{
            p: Point{ x: 1, y: 2 },
            s: emptyCell().asSlice()
        };
    }
}