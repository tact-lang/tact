struct Point {
    x: Int;
    y: Int;
}

struct Holder {
    point: Point;
    txt: String;
}

contract NestedMixedFields {
    f: Holder;

    init() {
        self.f = Holder{
            point: Point{ x:1, y:2 },
            txt: "abc"
        };
    }
}