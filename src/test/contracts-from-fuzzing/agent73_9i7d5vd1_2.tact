struct Point {
    x: Int;
    y: Int;
}

struct Wrapper {
    point: Point;
    maybe: Point?;
}

contract TestContract {
    state: Wrapper;

    init() {
        self.state = Wrapper{
            point: Point{ x: 1, y: 2 },
            maybe: null,
        };
    }
}