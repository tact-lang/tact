struct DeepMixed {
    inner1: Mixes;
    inner2: Mixes;
}

struct Mixes {
    x: Int;
    y: Bool;
    z: String;
    k: Int?;
    p: Bool?;
    q: String?;
}

contract DeepMixedContract {
    nested: DeepMixed;

    init() {
        self.nested = DeepMixed{
            inner1: Mixes{ x:1, y:true, z:"a", k: null, p:true, q:null },
            inner2: Mixes{ x:2, y:false, z:"b", k: 42, p:null, q:"done" }
        };
    }
}