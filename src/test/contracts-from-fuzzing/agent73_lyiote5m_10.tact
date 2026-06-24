struct DeepNest3 { z: Int; }
struct DeepNest2 { y: DeepNest3; }
struct DeepNest1 { x: DeepNest2; }

struct Top {
    a: Int;
    b: DeepNest1;
    c: Int;
}

contract Test {
    data: Top;

    init() {
        self.data = Top{
            a: 1,
            b: DeepNest1{ x: DeepNest2{ y: DeepNest3{ z: 5 } } },
            c: 6
        };
    }
}