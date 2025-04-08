struct S1 { x: Int; y: Int; }
struct S2 { z: Int; s1: S1; }

contract MultiNested {
    one: S1;
    two: S2;

    init() {
        self.one = S1{ x: 5, y:10 };
        self.two = S2{ z: 99, s1: S1{ x:1,y:2 } };
    }
}