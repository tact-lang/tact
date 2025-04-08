struct NestedMix {
    a: Int;
    b: Bool?;
}

struct TopMix {
    x: NestedMix;
    y: NestedMix;
    flag: Bool;
}

contract MixNestedOpt {
    val: TopMix;

    init() {
        self.val = TopMix{
            x: NestedMix{a:1,b:null},
            y: NestedMix{a:2,b:true},
            flag: false
        };
    }
}