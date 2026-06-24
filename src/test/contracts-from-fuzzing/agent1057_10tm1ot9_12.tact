struct Combination {
    intVal: Int;
    boolVal: Bool;
    strVal: String?;
    nested: NestedStruct;
}

struct NestedStruct {
    a: Int;
    b: Bool?;
    c: String;
}

contract ComboTest {
    storage: Combination;

    init() {
        self.storage = Combination{
            intVal: 1,
            boolVal: false,
            strVal: null,
            nested: NestedStruct{a:2,b:true,c:"hi"}
        };
    }
}