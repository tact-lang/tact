struct EmbedRem {
    a: Int;
    rest: Slice as remaining;
}

struct OuterEmbed {
    e1: EmbedRem;
    e2: EmbedRem;
}

contract MultipleRemainingEmbed {
    d: OuterEmbed;

    init() {
        self.d = OuterEmbed{
            e1: EmbedRem{ a:1, rest:"hi".asSlice() },
            e2: EmbedRem{ a:2, rest:"bye".asSlice() }
        };
    }
}