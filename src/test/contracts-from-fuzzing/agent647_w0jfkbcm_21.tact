// Large flat struct with many mixed fields
struct BigMix {
    i1: Int;
    b1: Bool;
    i2: Int?;
    b2: Bool?;
    s1: String;
    s2: String?;
    a1: Address;
    a2: Address?;
    c1: Cell;
    c2: Cell?;
    sl1: Slice;
    sl2: Slice?;
    bu1: Builder;
    bu2: Builder?;
}

contract TestContract {
    content: BigMix;

    init() {
        self.content = BigMix{
            i1: 1, b1: true, i2: null, b2: null,
            s1: "foo", s2: null,
            a1: myAddress(), a2: null,
            c1: emptyCell(), c2: null,
            sl1: emptyCell().asSlice(), sl2: null,
            bu1: beginCell(), bu2: null
        };
    }
}