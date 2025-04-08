struct Point {
    x: Int;
    y: Int;
    flag: Bool;
}

struct Holder {
    point: Point;
    flag: Bool;
}

contract TestContract {
    h: Holder;

    init() {
        self.h = Holder{
            point: Point{ x: 5, y: 10, flag: true },
            flag: false
        };
    }
}
