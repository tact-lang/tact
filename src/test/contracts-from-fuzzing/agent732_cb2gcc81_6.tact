struct NestedOptionalStruct {
    nested: InnerNest?;
}

struct InnerNest {
    value: Int?;
    flag: Bool;
}

contract NestedOptionalTest {
    val: NestedOptionalStruct;
    
    init() {
        self.val = NestedOptionalStruct{
            nested: InnerNest{
                value: null,
                flag: true
            }
        };
    }
}