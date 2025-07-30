struct InnerMost {
    flag: Bool;
}

struct Middle {
    nested: InnerMost;
    opt: Int?;
}

struct Outer {
    middle: Middle;
    someFlag: Bool;
}

contract DeepNestTest {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                nested: InnerMost{ flag: true },
                opt: null,
            },
            someFlag: false,
        };
    }
}