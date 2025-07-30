struct SInner { x: Int; }

struct SMid {
    inner: SInner;
    y: Bool?;
}

struct SOuter {
    mid: SMid?;
    lbl: String;
}

contract OptionUpDown {
    data: SOuter;

    init() {
        self.data = SOuter{ mid:null, lbl:"hi" };
    }
}