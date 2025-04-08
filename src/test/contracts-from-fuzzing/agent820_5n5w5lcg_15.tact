struct MultipleNestedOptionals {
    s1: SingleOptional?;
    s2: SingleOptional?;
}

struct SingleOptional {
    val: Int?;
}

contract TestContract {
    nestedOpt: MultipleNestedOptionals;
    init() {
        self.nestedOpt = MultipleNestedOptionals{
            s1: SingleOptional{val: null},
            s2: null,
        };
    }
}