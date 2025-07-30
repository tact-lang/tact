struct Deep3 {
    value: Int;
}

struct Deep2 {
    level3: Deep3;
}

struct Deep1 {
    level2: Deep2;
}

struct TopLevel {
    level1: Deep1;
}

contract DeepNestedContract {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            level1: Deep1{
                level2: Deep2{
                    level3: Deep3{
                        value: 999
                    }
                }
            }
        };
    }
}