struct NestedMix {
    one: InnerA;
    two: InnerB;
}

struct InnerA {
    x: Int?;
    y: Bool;
}

struct InnerB {
    msg: InnerC?;
}

struct InnerC {
    z: String;
}

contract NestedMixTest {
    val: NestedMix;

    init() {
        self.val = NestedMix{
            one: InnerA{x:null,y:true},
            two: InnerB{msg: InnerC{z:"world"}}
        };
    }
}