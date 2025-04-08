struct DeepOptional {
    val: Int?;
}

struct NextLevel {
    dopt: DeepOptional?;
}

struct TopLevel {
    next: NextLevel?;
}

contract DeepOpt {
    field: TopLevel;

    init() {
        self.field = TopLevel{
            next: null,
        };
    }
}