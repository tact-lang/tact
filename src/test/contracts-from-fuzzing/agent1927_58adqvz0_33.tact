message(0x1) M1 { x: Int }
message(0x2) M2 { y: Int }

contract MsgAsFieldTest {
    m1: M1;
    m2: M2;

    init() {
        self.m1 = M1{ x:5 };
        self.m2 = M2{ y:10 };
    }
}