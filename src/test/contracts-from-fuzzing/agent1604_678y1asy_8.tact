struct InnerStruct {
    val: Int;
}

struct OuterStruct {
    innerOptional: InnerStruct?;
}

contract OptNestedStructs {
    s: OuterStruct;

    init() {
        self.s = OuterStruct{
            innerOptional: null
        };
    }
}