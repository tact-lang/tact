struct MidNested {
    s1: Int;
    s2: Bool;
}

struct TopLevel {
    t1: MidNested;
    t2: Int?;
    t3: Bool;
    t4: String?;
    t5: Slice;
}

contract MixedNestedOptionalTest {
    var1: TopLevel;

    init() {
        self.var1 = TopLevel{
            t1: MidNested{
                s1: 7,
                s2: false,
            },
            t2: null,
            t3: true,
            t4: "str",
            t5: emptyCell().asSlice(),
        };
    }
}