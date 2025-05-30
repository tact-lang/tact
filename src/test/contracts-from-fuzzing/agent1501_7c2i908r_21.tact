struct SubNest {
    x: Int;
}

struct MidNest {
    sub: SubNest;
}

struct OuterWrap {
    mid: MidNest;
    extra: Int;
}

contract TestContract {
    payload: OuterWrap;

    init() {
        self.payload = OuterWrap{
            mid: MidNest{ sub: SubNest{ x:101} },
            extra: 202
        };
    }
}