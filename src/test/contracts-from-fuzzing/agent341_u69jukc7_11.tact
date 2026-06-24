struct NestedOptional {
    optInner: InnerStruct?;
}

struct InnerStruct {
    val: Int;
    flag: Bool;
}

contract TestContract {
    field: NestedOptional;

    init() {
        self.field = NestedOptional{
            optInner: InnerStruct{ val: 7, flag: true }
        };
    }
}