struct InnerRem {
    x: Int;
    rest: Slice as remaining;
}

struct OuterBroken {
    embed: InnerRem;
    y: Int;
}

contract NestedRemainWrong {
    d: OuterBroken;

    init() {
        self.d = OuterBroken{
            embed: InnerRem{ x:1, rest: "sss".asSlice() },
            y: 7
        };
    }
}