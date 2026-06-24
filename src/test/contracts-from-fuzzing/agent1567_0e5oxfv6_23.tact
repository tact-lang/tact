struct BoolOptMix {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;
}

contract OptBoolMix {
    val: BoolOptMix;

    init() {
        self.val = BoolOptMix{
            a:true, b:null, c:false, d:null
        };
    }
}