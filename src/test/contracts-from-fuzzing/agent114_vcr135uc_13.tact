struct Point {
    x: Int;
    y: Int;
}

contract MixedPersistentFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    p: Point;
    q: Point?;

    init() {
        self.a = 10;
        self.b = true;
        self.c = "abc";
        self.d = null;
        self.e = false;
        self.f = null;
        self.p = Point{x:1,y:2};
        self.q = null;
    }
}
