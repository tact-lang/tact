message(1) M1 { a: Int }
message(2) M2 { b: Int }
message(3) M3 { c: Int }
message(4) M4 { d: Int }
message(5) M5 { e: Int }

struct LotOptMsgs {
    m1: M1?;
    m2: M2?;
    m3: M3?;
    m4: M4?;
    m5: M5?;
}

contract TestContract {
    msgs: LotOptMsgs;

    init() {
        self.msgs = LotOptMsgs{
            m1: null,
            m2: M2{ b: 2 },
            m3: null,
            m4: M4{ d: 4 },
            m5: null
        };
    }
}
