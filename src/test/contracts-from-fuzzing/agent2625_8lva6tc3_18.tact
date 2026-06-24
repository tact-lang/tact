struct SInner {
    u: Int; 
    v: Bool;
}

struct SMid {
    m: SInner;
    n: String?;
}

struct STop {
    k: SMid;
    j: SInner;
}

contract NestedDefaults {
    s: STop;

    init() {
        self.s = STop{
            k: SMid{m:SInner{u:7,v:true},n:null},
            j: SInner{u:8,v:false}
        };
    }
}
