struct DeepNested {
    lvl1: Int;
    lvl2: Middle;
}

struct Middle {
    lvl3: Int;
    lvl4: Inner;
}

struct Inner {
    value: Int;
    optVal: Int?;
}

contract DeepNestStructTest {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{
            lvl1: 1,
            lvl2: Middle{
                lvl3: 3,
                lvl4: Inner{
                    value: 4,
                    optVal: null,
                },
            },
        };
    }
}