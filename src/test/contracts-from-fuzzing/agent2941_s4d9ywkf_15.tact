struct MixOptions {
    x: Int?;
    y: Bool;
    z: String?;
}

struct TopMix {
    a: MixOptions?;
    b: Bool?;
    c: String;
}

contract MixedNull {
    storage: TopMix;

    init() {
        self.storage = TopMix{
            a: null,
            b: null,
            c: "done",
        };
    }
}