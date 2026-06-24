struct MixDeep {
    i: Int;
    s: String;
    b: Bool;
}

struct NestMix {
    d1: MixDeep;
    d2: MixDeep;
}

contract Combos {
    data: NestMix;

    init() {
        self.data = NestMix{
            d1: MixDeep{i:1,s:"a",b:true},
            d2: MixDeep{i:2,s:"b",b:false}
        };
    }
}