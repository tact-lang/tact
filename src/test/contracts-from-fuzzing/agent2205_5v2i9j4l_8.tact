struct OptionalInner {
    val: Int?;
}

struct OuterOpt {
    nestedOpt: OptionalInner?;
}

contract NestedOptionalTest {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{ nestedOpt: null };
    }
}