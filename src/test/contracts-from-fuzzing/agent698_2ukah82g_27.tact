struct N1 { x: Int; }
struct N2 { y: Int; }
struct N3 { z: Int; }

struct Wide {
    a: N1;
    b: N2;
    c: N3;
    d: N1;
    e: N2;
    f: N3;
}

contract TestContract {
    data: Wide;

    init() {
        self.data = Wide{
            a:N1{ x:1 },
            b:N2{ y:2 },
            c:N3{ z:3 },
            d:N1{ x:4 },
            e:N2{ y:5 },
            f:N3{ z:6 },
        };
    }
}