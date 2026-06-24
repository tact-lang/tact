message(1) M1 { val: Int }

struct Wrap {
    m: M1;
}

message(2) M2 {
    w: Wrap;
}

contract NestedMsgInMsgField {
    data: M2;
    init() {
        self.data = M2{ w: Wrap{ m: M1{ val: 5 } } };
    }
}