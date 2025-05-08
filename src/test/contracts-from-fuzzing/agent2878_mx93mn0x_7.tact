struct NestedOptionals {
    level1: Int?;
    child: Child?;
}

struct Child {
    level2: Bool?;
    text: String?;
}

contract TestContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            level1: null,
            child: Child{ level2: true, text: null }
        };
    }
}