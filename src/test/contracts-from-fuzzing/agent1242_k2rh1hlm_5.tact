struct NestedOptionals {
    innerOpt: InnerStruct?;
}

struct InnerStruct {
    val: Int?;
}

contract TestContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            innerOpt: null,
        };
    }
}