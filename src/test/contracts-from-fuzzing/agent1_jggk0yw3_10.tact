struct DeepOptional {
    inner: InnerOpt?;
}

struct InnerOpt {
    value: Int?;
}

contract DeepOptionalTest {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            inner: InnerOpt{
                value: null,
            }
        };
    }
}