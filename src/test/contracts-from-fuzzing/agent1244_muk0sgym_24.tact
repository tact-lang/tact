message(0xAB) MType { x: Int; }

struct SubNest { val: Int; }

struct ComplexMix {
    x: Int;
    txt: String;
    sn: SubNest;
    yOpt: Int?;
    optSN: SubNest?;
    msg: MType;
    optMsg: MType?;
    flag: Bool;
}

contract CrazyLayout {
    store: ComplexMix;

    init() {
        self.store = ComplexMix{
            x: 10,
            txt: "hi",
            sn: SubNest{ val: 20 },
            yOpt: null,
            optSN: null,
            msg: MType{ x: 30 },
            optMsg: null,
            flag: true,
        };
    }
}
