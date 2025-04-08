struct InnerMostOpt {
    val: Int?;
}

struct MiddleOpt {
    nested: InnerMostOpt?;
}

contract OptionalOfOptional {
    mid: MiddleOpt?;

    init() {
        self.mid = MiddleOpt{
            nested: null
        };
    }
}