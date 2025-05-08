struct BaseLevel {
    data:Int;
}

struct MidLevel {
    base:BaseLevel;
}

struct TopLevel {
    mid:MidLevel;
}

contract DeepNest3 {
    t:TopLevel;

    init() {
        self.t = TopLevel{mid:MidLevel{base:BaseLevel{data:42}}};
    }
}