message(11) M1 { a: Int }
message(12) M2 { m1: M1 }
message(13) M3 { m2: M2 }

contract MsgNest {
    data: M3;

    init() {
        self.data = M3{
            m2: M2{
                m1: M1{
                    a: 321
                }
            }
        };
    }
}
