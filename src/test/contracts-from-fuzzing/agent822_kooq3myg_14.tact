// many optional fields mixed with regular in the same struct
struct OptMix {
    a: Int;
    b: String?;
    c: Bool;
    d: Address?;
    e: String;
    f: Int?;
}

contract TestContract {
    m: OptMix;
    init() {
        self.m = OptMix{
            a:1, b:null, c:true, d:null, e:"x", f:null
        };
    }
}
