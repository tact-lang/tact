struct Repeated {
    x: Int;
    y: Int;
    z: Int;
    w: Int;
    q: Int;
    r: Int;
    s: Int;
    t: Int;
    u: Int;
    v: Int;
    m: Int;
}

contract Test {
    rep: Repeated;

    init() {
        self.rep = Repeated{
            x:1, y:2, z:3, w:4, q:5, r:6, s:7, t:8, u:9, v:10, m:11
        };
    }
}