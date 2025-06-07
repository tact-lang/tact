struct DeepOptional {
    innerOpt: Inner?;
}

struct Inner {
    data: String?;
    n: Int?;
}

contract OptNestTest {
    optfield: DeepOptional;

    init() {
        self.optfield = DeepOptional{
            innerOpt: Inner{
                data: "data",
                n: null,
            },
        };
    }
}