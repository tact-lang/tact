struct SInner { x: Int; }

struct SWrap1 { inner: SInner; }
struct SWrap2 { inner: SInner; }

struct Stop {
    w1: SWrap1;
    w2: SWrap2;
}

contract MultiWrapped {
    val: Stop;

    init() {
        self.val = Stop{
            w1: SWrap1{ inner: SInner{ x: 1 } },
            w2: SWrap2{ inner: SInner{ x: 2 } }
        };
    }
}