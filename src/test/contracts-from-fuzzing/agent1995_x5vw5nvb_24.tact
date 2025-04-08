struct MixOption {
    a: Int?;
    b: Bool;
    c: String?;
    d: Bool?;
    e: Int;
}

contract OptMix {
    val: MixOption;

    init() {
        self.val = MixOption{
            a:null, b:true, c:null, d:false, e:42
        };
    }
}