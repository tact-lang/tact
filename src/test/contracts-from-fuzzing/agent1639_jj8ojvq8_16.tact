struct SInner {
    s: String;
}

struct SOuter {
    inn: SInner?;
    flag: Bool;
}

contract OptStructInside {
    outer: SOuter;

    init() {
        self.outer = SOuter{
            inn: SInner{
                s: "abc",
            },
            flag: false,
        };
    }
}
