struct InnerLevel {
    a: Int;
}

struct MidLevel {
    b: InnerLevel;
}

struct TopLevel {
    c: MidLevel;
}

contract NestedAssigns {
    lv: TopLevel;

    init() {
        self.lv = TopLevel{
            c: MidLevel{
                b: InnerLevel{
                    a: 777
                }
            }
        };
    }
}