struct Point {
    x: Int;
    y: Int;
}

struct Big {
    a: Point;
    b: Point;
    c: Point;
    d: Point;
    e: Point;
    f: Point;
    g: Point;
    h: Point;
    i: Point;
    j: Point;
    k: Point;
    l: Point;
    m: Point;
    n: Point;
    o: Point;
    p: Point;
    q: Point;
    r: Point;
    s: Point;
    t: Point;
    u: Point;
    v: Point;
    w: Point;
    x1: Point;
    y1: Point;
    z: Point;
}

contract Test {
    big: Big;
    init() {
        self.big = Big{
            a: Point{x:1,y:2}, b: Point{x:1,y:2}, c: Point{x:1,y:2}, d: Point{x:1,y:2}, e: Point{x:1,y:2},
            f: Point{x:1,y:2}, g: Point{x:1,y:2}, h: Point{x:1,y:2}, i: Point{x:1,y:2}, j: Point{x:1,y:2},
            k: Point{x:1,y:2}, l: Point{x:1,y:2}, m: Point{x:1,y:2}, n: Point{x:1,y:2}, o: Point{x:1,y:2},
            p: Point{x:1,y:2}, q: Point{x:1,y:2}, r: Point{x:1,y:2}, s: Point{x:1,y:2}, t: Point{x:1,y:2},
            u: Point{x:1,y:2}, v: Point{x:1,y:2}, w: Point{x:1,y:2},
            x1: Point{x:1,y:2}, y1: Point{x:1,y:2}, z: Point{x:1,y:2}
        };
    }
}