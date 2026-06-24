struct SSub {
    subfield: Int;
}

struct S {
    field1: Int;
    field2: Bool;
    field3: String;
    nested: SSub;
    optn: Slice?;
    addr: Address?;
    flag2: Bool?;
    big: Int;
}

contract BigMix2 {
    s: S;

    init() {
        self.s = S{
            field1:1,
            field2:true,
            field3:"hi",
            nested:SSub{subfield:7},
            optn: null,
            addr: null,
            flag2: null,
            big: 999
        };
    }
}