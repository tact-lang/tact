struct M1 { val: Int }
struct M2 { inner: M1 }

message(5) Msg1 {
    a: Int
}

message(6) Msg2 {
    m: M2
}

contract MsgNestTest {
    m1: Msg1;
    m2: Msg2;
    init() {
        self.m1 = Msg1{a: 5};
        self.m2 = Msg2{m: M2{inner: M1{val: 1}}};
    }
}