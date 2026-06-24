struct InnerMost {
    a: Int;
}

struct MidLevel {
    im: InnerMost;
}

struct MidOpt {
    mid: MidLevel?;
}

contract OptionMiddle {
    val: MidOpt;

    init() {
        self.val = MidOpt{
            mid: MidLevel{
                im: InnerMost{ a: 123 }
            }
        };
    }
}