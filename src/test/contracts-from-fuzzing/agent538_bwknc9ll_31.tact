struct MixedInner {
    i: Int;
    b: Bool;
    s: String;
    oi: Int?;
    ob: Bool?;
    os: String?;
}

contract NestedMixedOpt {
    inner: MixedInner;

    init() {
        self.inner = MixedInner{
            i:1,b:true,s:"s",
            oi:null,ob:null,os:null
        };
    }
}