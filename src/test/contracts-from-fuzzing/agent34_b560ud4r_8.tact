struct DeepOptional {
    inner: Int?;
}

struct MiddleOptional {
    sub: DeepOptional?;
}

contract TestContract {
    val: MiddleOptional?;

    init() {
        self.val = MiddleOptional{
            sub: DeepOptional{
                inner: 42,
            },
        };
    }
}