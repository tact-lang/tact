struct DeepNested {
    innermost: Int?;
}

struct MidNested {
    child: DeepNested;
}

struct TopNested {
    middle: MidNested;
}

contract TestNested {
    data: TopNested;

    init() {
        self.data = TopNested{
            middle: MidNested{
                child: DeepNested{
                    innermost: 10
                }
            }
        };
    }
}