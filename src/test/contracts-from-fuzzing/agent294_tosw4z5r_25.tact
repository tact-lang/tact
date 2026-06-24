message(50) DeepMsg {
    v: Int?;
}

struct Inner {
    m: DeepMsg? = null;
}

struct Outer {
    i: Inner? = null;
}

contract OptMsgNest {
    o: Outer;

    init() {
        self.o = Outer{};
    }
}
