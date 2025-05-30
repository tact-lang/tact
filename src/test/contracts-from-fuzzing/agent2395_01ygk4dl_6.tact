struct NestedOptionals {
    innerOpt: InnerOpt?;
}

struct InnerOpt {
    s: String?;
    b: Bool?;
}

contract NestedOptTest {
    store: NestedOptionals;

    init() {
        self.store = NestedOptionals{
            innerOpt: InnerOpt{
                s: null,
                b: true
            }
        };
    }
}
