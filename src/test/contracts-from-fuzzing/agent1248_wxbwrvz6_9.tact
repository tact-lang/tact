struct InnerMostSer {
    v1: Int as uint8;
    v2: Int?;
}

struct MiddleSer {
    m1: Int as int64;
    m2: InnerMostSer?;
}

struct OuterSer {
    o1: Bool;
    o2: MiddleSer?;
    o3: String;
}

contract ComplexAnnotations {
    stuff: OuterSer;

    init() {
        self.stuff = OuterSer{
            o1: false,
            o2: MiddleSer{
                m1: -55,
                m2: InnerMostSer{
                    v1: 200,
                    v2: null
                }
            },
            o3: "hello"
        };
    }
}
