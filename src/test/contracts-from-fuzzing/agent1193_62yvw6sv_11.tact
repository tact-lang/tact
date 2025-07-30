struct InnerMost {
    value: Int;
}

struct LevelTwo {
    nestedVal: InnerMost;
}

struct LevelOne {
    nestedTwo: LevelTwo;
}

struct TopContainer {
    nestedOne: LevelOne;
}

contract MultiNestDeep {
    store: TopContainer;

    init() {
        self.store = TopContainer{
            nestedOne: LevelOne{
                nestedTwo: LevelTwo{
                    nestedVal: InnerMost{value: 999},
                }
            }
        };
    }
}