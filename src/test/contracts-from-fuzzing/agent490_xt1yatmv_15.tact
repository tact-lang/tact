// deeply nested optional struct persistent
struct Tiny { val: Int; }

struct MidOpt {
    nested: Tiny?;
}

struct OuterOpt {
    inner: MidOpt?;
}

contract DeepOpt {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{ inner: null };
    }
}