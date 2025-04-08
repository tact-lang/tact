struct St {
    s1: Int;
    s2: Bool?;
}

message(11) M {
    m1: String?;
    m2: Int;
}

struct Both {
    st: St;
    msg: M;
}

contract NestedStructAndMsg {
    data: Both;

    init() {
        self.data = Both{
            st: St{ s1: 5, s2: null },
            msg: M{ m1: null, m2: 42 }
        };
    }
}
