struct Point {
    x: Int;
    y: Int;
}

contract TestContract {
    count: Int = 1;
    flag: Bool = true;
    key: Int;
    value: Int? = null;
    nested: Point = Point{ x: 10, y: 20 };
    optNested: Point? = null;
    big: Int = 9999999;
    small: Int;

    init() {
        self.key = 1234;
        self.small = -7;
    }
}