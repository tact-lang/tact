message(100) M1 { x: Int }
message(101) M2 { y: Int }

struct WithMsgs {
    m1: M1;
    m2: M2;
    m1opt: M1?;
}

contract NestedMessageFields {
    f: WithMsgs;

    init() {
        self.f = WithMsgs{
            m1: M1{x:1},
            m2: M2{y:2},
            m1opt: null
        };
    }
}