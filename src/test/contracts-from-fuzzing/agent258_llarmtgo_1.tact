struct NestedOptionalStruct {
    val: Int?;
    nested: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    text: String;
}

contract TestContract {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{
            val: null,
            nested: null,
        };
    }
}