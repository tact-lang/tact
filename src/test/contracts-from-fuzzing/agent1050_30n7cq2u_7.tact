struct NestedOptional {
    inner: Int?;
}

struct OuterStruct {
    nested: NestedOptional?;
    val: Int;
}

contract NestedOptionalStructs {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: null,
            val: 42
        };
    }
}