struct SInner {
    a: Int;
    b: String;
}

struct SMid {
    x: SInner;
    y: Int?;
}

struct SOuter {
    m: SMid;
    z: Bool;
}

contract MixedComplex {
    data: SOuter;
    init() {
        self.data = SOuter{
            m: SMid{
                x: SInner{
                    a: 42,
                    b: "hello"
                },
                y: null
            },
            z: true
        };
    }
}
