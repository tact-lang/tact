// deeply nested optional inside optional struct
struct InnerMost {
    d: Int?;
}

struct Mid {
    midOpt: InnerMost?;
    val: Bool;
}

contract OptionalInOptional {
    f: Mid;

    init() {
        self.f = Mid{
            midOpt: null,
            val: true,
        };
    }
}