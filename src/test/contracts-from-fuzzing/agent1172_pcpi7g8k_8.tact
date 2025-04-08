struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Params {
    name: String = "abc";
    age: Int?;
    point: Point;
}

contract SerialTest {
    field: Params;

    init() {
        self.field = Params{
            point: Point{ x: 1, y: 2 }
        };
    }
}