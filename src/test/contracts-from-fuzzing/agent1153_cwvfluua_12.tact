struct DeepOpt {
    innerOpt: Inner?;
}

struct Inner {
    str: String?;
}

contract NestedOptionalField {
    val: DeepOpt;

    init() {
        self.val = DeepOpt{
            innerOpt: null
        };
    }
}