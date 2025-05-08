struct OptionalInOptional {
    innerOpt: Inner?;
}

struct Inner {
    valOpt: Int?;
}

contract NestedOptionalTest {
    data: OptionalInOptional?;
    init() {
        self.data = OptionalInOptional{
            innerOpt: Inner{
                valOpt: 99,
            },
        };
    }
}