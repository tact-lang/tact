struct NestedMsgs {
    m1: M1;
    m2: M2;
}

message(1) M1 { foo: Int }
message(2) M2 { bar: String }

contract MsgMerge {
    val: NestedMsgs;

    init() {
        self.val = NestedMsgs{
            m1: M1{foo:10},
            m2: M2{bar:"hello"}
        };
    }
}
