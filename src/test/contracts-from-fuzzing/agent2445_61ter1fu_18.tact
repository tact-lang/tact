message(1) M1 { val: Int }
message(2) M2 { txt: String }
message(3) M3 { flag: Bool }

struct Pack {
    m1: M1;
    m2: M2;
    m3: M3;
}

contract C {
    p: Pack;

    init() {
        self.p = Pack{
            m1: M1{ val: 1 },
            m2: M2{ txt: "hi" },
            m3: M3{ flag: true },
        };
    }

    receive() {}
}