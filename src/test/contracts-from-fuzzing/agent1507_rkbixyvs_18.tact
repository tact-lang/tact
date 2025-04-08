struct OneLayer {
    i: Int;
    s: String;
}

struct TwoLayer {
    a: OneLayer;
    b: Int;
}

struct ThreeLayer {
    x: TwoLayer;
    y: Bool;
}

struct FourLayer {
    t: ThreeLayer;
    comment: String;
}

contract VeryDeepNest {
    val: FourLayer;

    init() {
        self.val = FourLayer{
            t: ThreeLayer{
                x: TwoLayer{
                    a: OneLayer{ i: 1, s: "deep" },
                    b: 2
                },
                y: true
            },
            comment: "ok"
        };
    }
}
