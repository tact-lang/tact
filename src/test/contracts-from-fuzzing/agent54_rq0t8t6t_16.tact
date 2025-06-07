struct NestedOptionalStruct {
    nestedopt: InnerOptional?;
}

struct InnerOptional {
    foo: Int;
}

contract NestedOptFieldContract {
    val: NestedOptionalStruct;

    init() {
        self.val = NestedOptionalStruct{
            nestedopt: InnerOptional{foo: 42}
        };
    }
}