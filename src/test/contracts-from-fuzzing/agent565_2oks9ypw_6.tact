struct DeeplyNestedOptional {
    a: Int?;
    inner: InnerStruct?;
}

struct InnerStruct {
    val: Int?;
    again: AgainStruct?;
}

struct AgainStruct {
    flag: Bool?;
}

contract TestContract {
    nested: DeeplyNestedOptional;

    init() {
        self.nested = DeeplyNestedOptional{
            a: null,
            inner: null
        };
    }
}