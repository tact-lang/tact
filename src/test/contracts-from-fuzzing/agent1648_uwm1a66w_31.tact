struct Inner1 { x: Int; y: Int; }
struct Inner2 { z: Int; }

struct Outer {
    i1: Inner1;
    i2: Inner2;
    num: Int;
    flag: Bool;
}

contract NestedDiverse {
    st: Outer;

    init() {
        self.st = Outer{
            i1: Inner1{ x:1, y:2 },
            i2: Inner2{ z:3 },
            num: 4,
            flag: true
        };
    }
}