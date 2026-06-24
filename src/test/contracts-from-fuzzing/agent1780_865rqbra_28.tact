struct InnerMostSerOpt {
    val: Int? as uint8;
}

struct MidNestSerOpt {
    deep: InnerMostSerOpt;
}

struct TopNestSerOpt {
    mid: MidNestSerOpt;
}

contract DeepOptionalSerde {
    data: TopNestSerOpt;

    init() {
        self.data = TopNestSerOpt{
            mid: MidNestSerOpt{
                deep: InnerMostSerOpt{
                    val: 7
                }
            }
        };
    }
}