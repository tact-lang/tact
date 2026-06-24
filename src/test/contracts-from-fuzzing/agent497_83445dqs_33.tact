struct DeepMix {
    a: Int;
    b: Bool?;
    c: String;
    more: NestedMix;
}

struct NestedMix {
    x: Int?;
    y: Bool;
    z: String?;
}

contract MixDeep {
    d: DeepMix;

    init() {
        self.d = DeepMix{
            a:1,
            b:null,
            c:"c",
            more: NestedMix{x:null,y:true,z:"x"}
        };
    }
}