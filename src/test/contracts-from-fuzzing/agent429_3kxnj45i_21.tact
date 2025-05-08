struct SBase {
    a: Int;
}

struct SMiddle {
    f1: Bool;
    embedded: SBase;
}

struct STop {
    x: String;
    mid: SMiddle;
    optVal: Int?;
}

contract MultiDepthEmbed {
    val: STop;
    init() {
        self.val = STop{
            x: "xx",
            mid: SMiddle{
                f1: true,
                embedded: SBase{
                    a: 5
                }
            },
            optVal: null,
        };
    }
}
