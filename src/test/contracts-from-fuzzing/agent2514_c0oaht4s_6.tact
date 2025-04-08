struct NestedOpt {
    innerOpt: InnerOpt?;
}

struct InnerOpt {
    val: Int;
}

contract NestedOptionalTest {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            innerOpt: null
        };
    }
}