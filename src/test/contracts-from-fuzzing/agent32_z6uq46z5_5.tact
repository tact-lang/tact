struct OptionNest {
    nestedOptional: Inner?;
}

struct Inner {
    value: Int?;
}

contract OptionalNestTest {
    val: OptionNest;

    init() {
        self.val = OptionNest{
            nestedOptional: null,
        };
    }
}
