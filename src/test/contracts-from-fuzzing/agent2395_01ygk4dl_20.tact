struct ComboNested {
    intVal: Int;
    optBool: Bool?;
    nested: NestedStruct;
}

struct NestedStruct {
    optString: String?;
    boolVal: Bool;
}

contract ComboNestedTest {
    data: ComboNested;

    init() {
        self.data = ComboNested{
            intVal: 5,
            optBool: null,
            nested: NestedStruct{ optString:null, boolVal:true }
        };
    }
}
