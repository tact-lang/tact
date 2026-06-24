struct DeeplyNested {
    level1: Int;
    level2: InnerLevel;
}

struct InnerLevel {
    a: Int;
    b: InnerLevel2;
    c: Bool;
}

struct InnerLevel2 {
    d: Int;
    e: Bool;
}

contract DeepNestTest {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            level1: 1,
            level2: InnerLevel{
                a: 2,
                b: InnerLevel2{d:3,e:true},
                c: false
            }
        };
    }
}