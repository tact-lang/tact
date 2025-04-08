struct InnerMost {
    foo: Int;
    bar: Bool?;
}

struct MidLayer {
    deeper: InnerMost;
    maybeDeeper: InnerMost?;
    flag: Bool;
    number: Int;
}

struct Top {
    mid: MidLayer;
    optionalMid: MidLayer?;
}

contract MultipleLayers {
    storage: Top;

    init() {
        self.storage = Top{
            mid: MidLayer{
                deeper: InnerMost{ foo: 1, bar: true },
                maybeDeeper: null,
                flag: false,
                number: 10
            },
            optionalMid: null
        };
    }
}