struct NestedOpt {
    innerOpt: Int?;
    innerStrOpt: String?;
}

contract OptionalStructTest {
    nestedOpt: NestedOpt?;

    init() {
        self.nestedOpt = NestedOpt{
            innerOpt: null,
            innerStrOpt: "test",
        };
    }
}