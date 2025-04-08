struct OptionalInner {
    val: Int?;
}

struct OptionalNested {
    innerOpt: OptionalInner?;
}

contract OptNestedOptTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            innerOpt: null
        };
    }
}