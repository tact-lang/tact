struct Point {
    x: Int;
    y: Int;
}

contract LongMix {
    a: Int = 1;
    b: Bool = false;
    c: String = "c";
    d: Int? = null;
    e: Bool? = null;
    f: Point = Point{ x: 0, y: 0 };
    g: Point? = null;
    h: String = "h";
    i: Int = 9;
    j: Bool? = true;

    init() {
        self.a = 42;
    }
}