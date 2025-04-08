struct NestedOptional {
    innerOpt: Int?;
    boolVal: Bool;
}

struct OuterWithInnerOpt {
    nested: NestedOptional?;
    flag: Bool;
}

contract TestContract {
    val: OuterWithInnerOpt;

    init() {
        self.val = OuterWithInnerOpt{
            nested: null,
            flag: true
        };
    }
}