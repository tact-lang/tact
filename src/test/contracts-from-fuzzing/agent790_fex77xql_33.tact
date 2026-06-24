struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Params {
    id: Int;
    name: String;
    point: Point;
}

contract EmbeddedStructs {
    p: Params;

    init() {
        self.p = Params{
            id:42,
            name:"foo",
            point:Point{x:1,y:2}
        };
    }
}