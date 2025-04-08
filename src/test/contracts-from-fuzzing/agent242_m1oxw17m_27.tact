struct AltSeq {
    b: Bool;
    o1: Int?;
    s: String;
    o2: String?;
    n: NestedOpt?;
}

struct NestedOpt {
    k: Int?;
    val: Bool;
}

contract Alternating {
    m: AltSeq;
    init() {
        self.m = AltSeq{
            b: false,
            o1: null,
            s: "abc",
            o2: null,
            n: null,
        };
    }
}