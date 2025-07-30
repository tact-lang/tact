struct Point {
    x: Int;
    y: Int;
}

struct Wrapper {
    point: Point;
    flag: Bool;
}

contract StorageNested {
    inner: Wrapper;

    init() {
        self.inner = Wrapper{
            point: Point{ x: 10, y: 20 },
            flag: false
        };
    }
}