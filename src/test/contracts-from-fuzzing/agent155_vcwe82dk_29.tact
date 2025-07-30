message(0x11) M1 {
    x: Int = 1;
}

message(0x22) M2 {
    y: Int = 2;
}

struct NestedMsgs {
    m1: M1?;
    m2: M2?;
}

contract TestContract {
    nm: NestedMsgs = NestedMsgs{ m1: null, m2: null };

    init() {
        self.nm = NestedMsgs{ m1: null, m2: null };
    }
}