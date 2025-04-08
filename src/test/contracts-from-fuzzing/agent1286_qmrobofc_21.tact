struct ABC {
    a: Int;
    b: Bool;
    c: DEF;
}

struct DEF {
    d: Bool;
    e: String?;
    f: GHI;
}

struct GHI {
    g: Bool;
    h: Int?;
}

contract NestedChain {
    val: ABC;

    init() {
        self.val = ABC{
            a:10, b:true, c: DEF{ d:false, e:null, f:GHI{ g:true, h:null } }
        };
    }
}