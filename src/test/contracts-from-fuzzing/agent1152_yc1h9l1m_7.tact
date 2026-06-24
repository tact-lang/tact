struct Small {
    a: Int;
}

struct Outer {
    x: Small;
    y: Small;
    z: Small;
}

contract Test {
    rec: Outer;

    init() {
        self.rec = Outer{
            x: Small{a:1},
            y: Small{a:2},
            z: Small{a:3},
        };
    }
}