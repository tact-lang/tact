struct InnerMost {
    flag: Bool;
    comment: String?;
}

struct Mid {
    val: Int;
    im: InnerMost;
}

struct Outer {
    m: Mid;
    optionalInt: Int?;
}

contract DeepOptional {
    storage: Outer;

    init() {
        self.storage = Outer{
            m: Mid{
                val: 7,
                im: InnerMost{
                    flag: false,
                    comment: null,
                }
            },
            optionalInt: null,
        };
    }
}