struct DeepNested {
    field1: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    val: Int;
    nested: NestedStruct;
}

struct NestedStruct {
    opt: Bool?;
    num: Int;
}

contract TestContract {
    data: DeepNested = DeepNested{
        field1:1,
        inner: InnerStruct{
            val:2,
            nested: NestedStruct{
                opt:true,
                num:3
            }
        }
    };
    
    receive() {
        // no-op
    }
}