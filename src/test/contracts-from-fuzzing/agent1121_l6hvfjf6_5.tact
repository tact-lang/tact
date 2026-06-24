struct Point {
    x: Int?;
    y: Int?;
}

struct MaybePoint {
    p: Point?;
}

contract NestedOptionalStruct {
    mp: MaybePoint;

    init() {
        self.mp = MaybePoint{p: null};
    }
}