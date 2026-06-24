struct SOne { x: Int }
struct STwo { y: Int }

contract ManyStructs {
    s1: SOne;
    s2: STwo;

    init() {
        self.s1 = SOne{ x: 1 };
        self.s2 = STwo{ y: 2 };
    }
}