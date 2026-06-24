struct A { x: Int as int32; }
struct B { y: Int as uint128; }
struct C { z: Int as int64; }

contract MixedSizedFields {
    f1: A;
    f2: B;
    f3: C;

    init() {
        self.f1 = A{ x: -1000 };
        self.f2 = B{ y: 1234567890 };
        self.f3 = C{ z: -999999 };
    }
}