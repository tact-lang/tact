struct S1 { x: Int; }
struct S2 { y: Int; }

struct OuterStruct {
    f1: S1;
    f2: S2;
    z: Int;
}

contract MixedStructTest {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            f1: S1{ x: 11 },
            f2: S2{ y: 22 },
            z: 33
        };
    }

    receive() {
        self.data = OuterStruct{
            f1: S1{ x: 111 },
            f2: S2{ y: 222 },
            z: 333
        };
    }
}