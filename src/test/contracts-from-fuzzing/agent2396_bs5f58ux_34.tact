struct SInner {
    x: Int;
    flag: Bool?;
}
struct SOuter {
    s: SInner?;
    txt: String?;
}

contract NestOptCombo {
    field: SOuter;

    init() {
        self.field = SOuter{
            s: null,
            txt: null
        };
    }
}