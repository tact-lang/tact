struct NestedEmptyOptional {
    inner: String?;
}

struct WrapperOpt {
    nested: NestedEmptyOptional?;
}

contract NestedNullTest {
    data: WrapperOpt;

    init() {
        self.data = WrapperOpt{
            nested: null
        };
    }
}