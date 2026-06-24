struct BigMix {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

struct BigMixOuter {
    x: BigMix;
    y: BigMix;
}

contract BigMixTest {
    val: BigMixOuter;
    init() {
        self.val = BigMixOuter{
            x: BigMix{
                a:1, b:true, c:"x",
                d:null,e:null,f:null
            },
            y: BigMix{
                a:2, b:false, c:"y",
                d:null,e:null,f:null
            }
        };
    }
}