struct InnerMost {
    x: Int;
    y: Int;
}

struct InnerMid {
    im: InnerMost;
    s: String;
}

struct InnerTop {
    mid: InnerMid;
    c: Cell;
}

contract Test9 {
    t: InnerTop;

    init() {
        self.t = InnerTop{
            mid: InnerMid{
                im: InnerMost{
                    x:5,
                    y:7,
                },
                s: "str",
            },
            c: emptyCell(),
        };
    }
}