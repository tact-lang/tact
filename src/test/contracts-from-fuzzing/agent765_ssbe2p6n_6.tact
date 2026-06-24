struct DeepNested {
    lvl1: Int;
    lvl2: InnerLevel;
}

struct InnerLevel {
    a: Bool;
    b: Leaf;
}

struct Leaf {
    data: String;
    flag: Bool;
}

contract DeepNesting {
    nested: DeepNested;
    init() {
        self.nested = DeepNested{
            lvl1: 1,
            lvl2: InnerLevel{
                a: true,
                b: Leaf{
                    data: "deep",
                    flag: false
                }
            }
        };
    }
}