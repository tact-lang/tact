struct DeepNested {
    lvl3_field: Int?;
}

struct MiddleNested {
    lvl2_field: DeepNested;
}

struct TopNested {
    lvl1_field: MiddleNested;
}

contract DeepNestContract {
    deep: TopNested;

    init() {
        self.deep = TopNested{
            lvl1_field: MiddleNested{
                lvl2_field: DeepNested{
                    lvl3_field: null,
                },
            },
        };
    }
}