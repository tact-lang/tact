struct NestedOptionals {
    innerOpt: InnerOpt?;
}

struct InnerOpt {
    flag: Bool?;
}

contract NestedOptionalFieldTest {
    field: NestedOptionals;

    init() {
        self.field = NestedOptionals{
            innerOpt: InnerOpt{
                flag: false
            }
        };
    }
}