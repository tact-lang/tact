struct MixOpt {
    i: Int;
    o1: Int?;
    st: SubStruct;
    o2: SubStruct?;
}

struct SubStruct {
    x: Int;
}

contract TestContract {
    m: MixOpt;

    init() {
        self.m = MixOpt{ i:1, o1:null, st:SubStruct{x:2}, o2:null };
    }
}