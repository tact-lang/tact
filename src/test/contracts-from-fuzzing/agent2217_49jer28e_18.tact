struct Wrap {
    w1: InnerWrap;
    w2: InnerWrap;
    w3: InnerWrap;
}

struct InnerWrap {
    x: Int;
    y: Bool;
    z: String?;
}

contract MultiWrap {
    data: Wrap;

    init() {
        self.data = Wrap{
            w1: InnerWrap{ x:1,y:true,z:null },
            w2: InnerWrap{ x:2,y:false,z:null },
            w3: InnerWrap{ x:3,y:true,z:null }
        };
    }
}
