struct SInner {
    f: Int;
    t: String;
}

struct SOuter {
    inner: SInner;
    text: String;
}

contract Test {
    s: SOuter;

    init() {
        self.s = SOuter{
            inner: SInner{ f:1, t:"x" },
            text: "outer"
        };
    }
}