struct SInner {
    flag: Bool;
}

struct SOuter {
    si: SInner;
}

contract AssignPart {
    x: SOuter;

    init() {
        self.x = SOuter{si: SInner{flag:true}};
        self.x.si = SInner{flag:false};
    }
}