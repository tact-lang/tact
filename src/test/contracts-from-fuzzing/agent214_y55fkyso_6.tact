struct SInner {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct SOuter {
    x: Int;
    y: SInner;
    z: Int?;
}

contract OptionalsDeeper {
    s: SOuter;

    init() {
        self.s = SOuter{
            x: 1,
            y: SInner{
                a: null,
                b: "hello",
                c: true
            },
            z: null
        };
    }
}
