message Msg1 {
    a: Int = 5;
}

message Msg2 {
    b: Bool = false;
}

struct WithDefaults {
    m1: Msg1;
    m2: Msg2;
}

contract MsgDefaultsTest {
    data: WithDefaults;
    init() {
        self.data = WithDefaults{
            m1: Msg1{},
            m2: Msg2{}
        };
    }
}