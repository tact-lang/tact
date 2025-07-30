struct EmbeddedSerialization {
    s: InnerS;
}

struct InnerS {
    a: Int as uint4;
    b: Bool;
    c: Int? as uint20;
}

contract TestContract {
    data: EmbeddedSerialization;

    init() {
        self.data = EmbeddedSerialization{
            s: InnerS{
                a: 12,
                b: true,
                c: null
            }
        };
    }
}