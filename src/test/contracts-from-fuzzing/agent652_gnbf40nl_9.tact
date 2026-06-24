struct NestedStructWithSerialization {
    point: Point;
    params: Params;
}

struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Params {
    age: Int?;
    name: String;
    flag: Bool;
}

contract TestContract {
    data: NestedStructWithSerialization;

    init() {
        self.data = NestedStructWithSerialization{
            point: Point{ x: 1, y: 2 },
            params: Params{ age: null, name: "abc", flag: true }
        };
    }
}