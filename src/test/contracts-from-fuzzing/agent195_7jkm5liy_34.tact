struct InnerMost {
    value: Int;
}

struct Mid {
    inr: InnerMost;
    opt: Int?;
}

struct Out {
    mid: Mid;
    flag: Bool?;
}

contract DeepOpc {
    container: Out;

    init() {
        self.container = Out{
            mid: Mid{
                inr: InnerMost{ value:5 },
                opt: null
            },
            flag: null
        };
    }
}
