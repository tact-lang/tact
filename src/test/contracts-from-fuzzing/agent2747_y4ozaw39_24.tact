struct SInner { x: Int?; y: String?; }

struct SOuter {
    inner: SInner?;
    num: Int;
    text: String;
}

contract OptionalMix {
    rec: SOuter;

    init() {
        self.rec = SOuter{
            inner: SInner{x: null, y: null},
            num: 10,
            text: "ok"
        };
    }
}