struct InnerMost {
    f1: Int;
    f2: Bool;
    f3: String;
}

struct InnerOptional {
    val: InnerMost?;
}

struct Mid {
    opt1: InnerOptional?;
    opt2: Int?;
    flag: Bool;
}

contract DeepOptional {
    d: Mid?;

    init() {
        self.d = Mid{
            opt1: InnerOptional{
                val: InnerMost{
                    f1: 100,
                    f2: false,
                    f3: "xyz",
                },
            },
            opt2: null,
            flag: true,
        };
    }
}