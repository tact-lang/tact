struct DeepOptional {
    inner: Int?;
}

struct MiddleOptional {
    inner: DeepOptional?;
}

struct TopOptional {
    inner: MiddleOptional?;
}

contract OptionalNestingTest {
    data: TopOptional;

    init() {
        self.data = TopOptional {
            inner: MiddleOptional{
                inner: DeepOptional{
                    inner: null
                }
            }
        };
    }
}
