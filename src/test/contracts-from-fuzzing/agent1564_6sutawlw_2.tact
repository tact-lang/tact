struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Wrapper {
    point: Point;
    optBool: Bool?;
    text: String;
}

contract MultiTypeStructStorage {
    wrapper: Wrapper;

    init() {
        self.wrapper = Wrapper{
            point: Point{ x: 1, y: 2 },
            optBool: true,
            text: "hello"
        };
    }
}