struct NestedOptionalInStruct {
    opt: Int?;
    sub: SubStruct?;
}

struct SubStruct {
    innerVal: Int;
}

contract Test {
    val: NestedOptionalInStruct;

    init() {
        self.val = NestedOptionalInStruct{
            opt: null,
            sub: null,
        };
    }
}