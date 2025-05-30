struct LargeNested {
    a: Int;
    b: Bool;
    c: String;
    d: String?;
    e: Bool?;
    f: Int?;
}

struct LargerOuter {
    n1: LargeNested;
    n2: LargeNested;
    s: String;
}

contract BigNest {
    val: LargerOuter;

    init() {
        self.val = LargerOuter{
            n1: LargeNested{ a:1,b:true,c:"X",d:null,e:null,f:null },
            n2: LargeNested{ a:2,b:false,c:"Y",d:"d",e:true,f:5 },
            s: "done",
        };
    }
}