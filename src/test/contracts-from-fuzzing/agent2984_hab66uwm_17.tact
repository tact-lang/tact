struct OptStruct1 { v: Int? }
struct OptStruct2 { v: Bool? }

struct TopWrap {
    s1: OptStruct1?;
    s2: OptStruct2?;
}

contract Test18 {
    t: TopWrap;
    init() {
        self.t = TopWrap{ s1:null, s2:null };
    }
}
