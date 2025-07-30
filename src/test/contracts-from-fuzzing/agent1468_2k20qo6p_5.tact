struct NestedOptionals {
    val1: Int?;
    val2: Bool?;
    nested: InnerOpt?;
}

struct InnerOpt {
    str: String?;
    num: Int?;
}

contract TestNestedOptionals {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            val1: null,
            val2: null,
            nested: null,
        };
    }
}
