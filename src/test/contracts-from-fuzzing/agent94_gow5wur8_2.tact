struct Point {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
}

contract Test {
    point: Point;

    init() {
        self.point = Point{
            a:0,b:0,c:0,d:0,e:0,f:0,g:0,h:0,
        };
    }
}