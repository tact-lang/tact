struct Coord {
    x: Int;
    y: Int;
    z: Int;
    t: Int;
    u: Int;
    v: Int;
    w: Int;
    q: Int;
    r: Int;
    s: Int;
}

contract ManyFields {
    point: Coord;

    init() {
        self.point = Coord{
            x: 1, y: 2, z: 3, t: 4, u: 5, v: 6, w:7, q:8, r:9, s:10
        };
    }
}