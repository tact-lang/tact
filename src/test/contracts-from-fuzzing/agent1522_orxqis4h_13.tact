struct SInner {
    a: Int;
}

struct SMid {
    x: Int;
    si: SInner;
}

struct SOut {
    sm1: SMid;
    sm2: SMid;
}

contract MultiNested {
    big: SOut;

    init() {
        self.big = SOut{
            sm1: SMid{ x: 1, si: SInner{ a: 2 } },
            sm2: SMid{ x: 3, si: SInner{ a: 4 } },
        };
    }

    receive() {
        let _ = self.big;
    }
}