message(11) M1 { a: Int; }
message(22) M2 { b: Bool; }

struct NestedMsgs {
    m1: M1;
    m2: M2;
    m1opt: M1?;
    m2opt: M2?;
}

contract MsgsNested {
    field: NestedMsgs;

    init() {
        self.field = NestedMsgs{
            m1: M1{a:1},
            m2: M2{b:true},
            m1opt: null,
            m2opt: null
        };
    }
}
