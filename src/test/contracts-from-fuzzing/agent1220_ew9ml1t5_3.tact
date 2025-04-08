struct NestedOptional {
    innerOpt: Int?;
}

struct Middle {
    nestedOpt: NestedOptional?;
}

contract DeepOptionalTest {
    data: Middle;

    init() {
        self.data = Middle{
            nestedOpt: null
        };
    }
}