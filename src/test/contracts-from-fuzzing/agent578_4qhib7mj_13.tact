struct MidNest {
    a: Int;
    b: InnerMost;
}

struct InnerMost {
    s: String;
    f: Bool;
}

struct DeepOuter {
    i: Int;
    m: MidNest;
    j: Bool;
}

contract DeepFields {
    deeep: DeepOuter;

    init() {
        self.deeep = DeepOuter {
            i: 7,
            j: false,
            m: MidNest {
                a: 8,
                b: InnerMost {
                    s: "ok",
                    f: true
                }
            }
        };
    }
}