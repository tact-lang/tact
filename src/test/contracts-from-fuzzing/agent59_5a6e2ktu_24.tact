struct SInner {
    a: Int;
    b: Int?;
    c: String?;
}

struct SOuter {
    x: SInner;
    y: SInner?;
}

contract TestOption {
    value: SOuter;

    init() {
        self.value = SOuter{
            x: SInner{ a:1, b:null, c:null },
            y: null
        };
    }
}