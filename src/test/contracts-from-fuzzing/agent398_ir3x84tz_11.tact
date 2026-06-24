struct Leaf { n: Int as uint8 }

struct OddMix {
    optFlag: Bool?;
    leaf: Leaf;
    count: Int;
    smallVal: Int as int16;
    optInt: Int?;
    flag: Bool;
}

contract OddMixContract {
    mix: OddMix;

    init() {
        self.mix = OddMix{
            optFlag: true,
            leaf: Leaf{ n: 123 },
            count: 987654,
            smallVal: -32000,
            optInt: null,
            flag: false
        };
    }
}