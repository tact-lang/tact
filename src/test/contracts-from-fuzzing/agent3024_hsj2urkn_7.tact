struct NestedOptionals {
    innerOpt: Int?;
    anotherOpt: String?;
    nested: DeepOpt?;
}

struct DeepOpt {
    val: Bool;
}

contract TestNestedOptionals {
    st: NestedOptionals;

    init() {
        self.st = NestedOptionals{
            innerOpt: null,
            anotherOpt: "yes",
            nested: DeepOpt{val: true}
        };
    }
}
