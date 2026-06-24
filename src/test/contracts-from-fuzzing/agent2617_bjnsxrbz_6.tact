struct Nester {
    inner1: Int;
    inner2: String;
}

struct TopLevel {
    nested1: Nester;
    nested2: Nester;
    extraFlag: Bool;
}

contract MultiNested {
    val: TopLevel;
    init() {
        self.val = TopLevel{
            nested1: Nester{ inner1: 10, inner2: "hi" },
            nested2: Nester{ inner1: 20, inner2: "hello" },
            extraFlag: false
        };
    }
}