struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct ContainerOpt {
    s: NestedOptionals;
}

contract OptionalTrees {
    val: ContainerOpt;

    init() {
        self.val = ContainerOpt{
            s: NestedOptionals{
                a: null,
                b: null,
                c: null
            }
        };
    }
}