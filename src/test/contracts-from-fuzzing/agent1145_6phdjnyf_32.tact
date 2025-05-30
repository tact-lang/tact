struct BigMix {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int as uint16;
    h: Int as int64;
    i: Int as uint256;
    nested: Nested;
}

struct Nested {
    x: Int?;
    y: String;
    z: Bool;
}

contract BigMixTest {
    val: BigMix;

    init() {
        self.val = BigMix{
            a:1,b:true,c:"str",d:null,e:false,f:null,
            g:100,h:1000,i:10000,
            nested: Nested{ x: null, y: "nest", z: true }
        };
    }
}
