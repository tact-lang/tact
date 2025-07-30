struct Point { x: Int; y: Int; }
struct Wrapper { p: Point; extra: Int; }

contract Nested {
    w: Wrapper;

    init() {
        self.w = Wrapper{ p: Point{ x: 5, y: 6 }, extra: 42 };
    }
}