struct Point {
    x: Int;
    y: Int;
}

struct HasDefaultStruct {
    pt: Point = Point{ x: 10, y: 20 };
}

contract Test {
    val: HasDefaultStruct;

    init() {
        self.val = HasDefaultStruct{};
    }
}