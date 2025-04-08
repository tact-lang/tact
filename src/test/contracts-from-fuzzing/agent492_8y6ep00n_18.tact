struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Params {
    id: Int;
    description: String;
    flag: Bool;
    loc: Point;
}

contract Foo {
    data: Params;

    init() {
        self.data = Params{
            id: 42,
            description: "test",
            flag: true,
            loc: Point{x:1,y:2}
        };
    }
}