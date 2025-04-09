struct DeepOptional {
    val: Int?;
    nested: InnerOpt?;
}

struct InnerOpt {
    a: Int?;
    b: Bool?;
}

contract DeepOptionalContract {
    data: DeepOptional;
    init() {
        self.data = DeepOptional{
            val: null,
            nested: InnerOpt{
                a: 42,
                b: false
            }
        };
    }
}