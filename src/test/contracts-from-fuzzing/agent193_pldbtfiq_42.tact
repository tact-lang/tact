struct BigMix {
    a: Int;
    b: Int?;
    c: Bool? = false;
    d: String? = "x";
    e: Int?;
    f: Bool;
    g: Int? = 5;
    h: String;
    i: Int?;
    j: Bool?;
}

contract ComplexStruct {
    val: BigMix;

    init() {
        self.val = BigMix{
            a:1, b:null, d:null, e:null, f:true, h:"ok", i:null, j:null
        };
    }
}