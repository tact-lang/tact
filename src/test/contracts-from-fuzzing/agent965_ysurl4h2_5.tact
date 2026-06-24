struct SubLevel {
    a: Int;
    b: Int;
}

struct MidLevel {
    s1: SubLevel;
    s2: SubLevel;
}

struct TopLevel {
    m1: MidLevel;
    m2: MidLevel;
}

contract DeepNestedStructs {
    nested: TopLevel;

    init() {
        self.nested = TopLevel{
            m1: MidLevel{
                s1: SubLevel{a:1,b:2},
                s2: SubLevel{a:3,b:4},
            },
            m2: MidLevel{
                s1: SubLevel{a:5,b:6},
                s2: SubLevel{a:7,b:8},
            }
        };
    }
}