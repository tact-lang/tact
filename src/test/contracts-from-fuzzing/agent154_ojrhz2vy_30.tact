struct Opts1 { a: Int?; b: Int?; }

struct Opts2 { c: Bool?; d: Bool?; }

struct AllOptContainer {
    o1: Opts1?;
    o2: Opts2?;
}

contract OptOptOptOpt {
    data: AllOptContainer;

    init() {
        self.data = AllOptContainer{ o1:null, o2:null };
    }
}