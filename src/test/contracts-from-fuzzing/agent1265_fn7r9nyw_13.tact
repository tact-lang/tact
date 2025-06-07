struct SInner1 { x: Int; }
struct SInner2 { y: Bool; }
struct SMid {
    inner1: SInner1;
    inner2: SInner2;
}

struct STop {
    mid: SMid;
    flag: Bool;
    desc: String;
}

contract DeepMix {
    content: STop;

    init() {
        self.content = STop{
            mid: SMid{ inner1: SInner1{x:10}, inner2: SInner2{y:true} },
            flag: false,
            desc: "",
        };
    }
}