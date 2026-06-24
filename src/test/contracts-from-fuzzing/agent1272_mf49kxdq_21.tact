struct OptionalMix {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

struct RequiredMix {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

struct TopMix {
    req: RequiredMix;
    opt: OptionalMix;
}

contract MixNestedCombined {
    val: TopMix;

    init() {
        self.val = TopMix{
            req: RequiredMix{
                a: 1,
                b: true,
                c: myAddress(),
                d: emptyCell(),
                e: emptyCell().asSlice(),
                f: "hi"
            },
            opt: OptionalMix{
                a:null, b:null, c:null, d:null, e:null, f:null
            }
        };
    }
}