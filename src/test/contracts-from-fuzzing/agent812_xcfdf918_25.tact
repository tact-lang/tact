struct WideNest {
    a: Layered;
    b: Layered;
    c: Layered;
}

struct Layered {
    i: Int;
    s: InnerStr;
}

struct InnerStr {
    t: String;
    addr: Address;
}

contract MultiWideDeep {
    val: WideNest;

    init() {
        self.val = WideNest{
            a: Layered{i: 1, s: InnerStr{t:"t", addr:myAddress()}},
            b: Layered{i: 2, s: InnerStr{t:"u", addr:myAddress()}},
            c: Layered{i: 3, s: InnerStr{t:"v", addr:myAddress()}}
        };
    }
}