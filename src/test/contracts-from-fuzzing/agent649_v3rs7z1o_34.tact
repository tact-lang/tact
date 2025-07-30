struct SA { x: Int; }
struct SB { y: Int; }
struct SC { z: Int; }

contract ManySmallStructs {
    s1: SA;
    s2: SB;
    s3: SC;

    init() {
        self.s1 = SA{ x:10 };
        self.s2 = SB{ y:20 };
        self.s3 = SC{ z:30 };
    }
}