struct MixedTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optIntVal: Int?;
    optStrVal: String?;
    nested: NestedStruct;
}

struct NestedStruct {
    flag: Bool;
    number: Int;
    text: String?;
}

contract EdgeCase {
    data: MixedTypes;

    init() {
        self.data = MixedTypes{
            intVal: 1,
            boolVal: true,
            strVal: "abc",
            optIntVal: null,
            optStrVal: null,
            nested: NestedStruct{
                flag: false,
                number: 99,
                text: null,
            },
        };
    }
}
