struct DeepOptional {
    inner: Int?;
}

struct MiddleOptional {
    deep: DeepOptional?;
}

struct OuterOptional {
    middle: MiddleOptional?;
}

contract OptionalNestContract {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            middle: null
        };
    }
}