struct DeeplyNested {
    inner: InnerStruct?;
}

struct InnerStruct {
    field: Int?;
}

contract NestedOptionalTest {
    data: DeeplyNested;
    
    init() {
        self.data = DeeplyNested{ inner: InnerStruct{ field: null } };
    }
}