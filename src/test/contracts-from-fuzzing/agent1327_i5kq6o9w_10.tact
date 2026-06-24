struct InnerLayer {
    val: Int;
    text: String?;
    flag: Bool;
}

struct MidLayer {
    inner1: InnerLayer;
    inner2: InnerLayer?;
}

struct OuterLayer {
    mid: MidLayer;
    optmid: MidLayer?;
}

contract Layers {
    data: OuterLayer;

    init() {
        self.data = OuterLayer {
            mid: MidLayer {
                inner1: InnerLayer {val:1,text:null,flag:true},
                inner2: null
            },
            optmid: null
        };
    }
}