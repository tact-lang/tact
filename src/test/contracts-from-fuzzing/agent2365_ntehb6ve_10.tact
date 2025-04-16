struct MixedTypes {
    intVal: Int;
    optBool: Bool?;
    str: String;
    optAddr: Address?;
    nested: NestedStruct;
}

struct NestedStruct {
    flag: Bool;
    num: Int;
}

contract MixedTypesTest {
    val: MixedTypes;

    init() {
        self.val = MixedTypes{
            intVal: 10,
            optBool: null,
            str: "string",
            optAddr: null,
            nested: NestedStruct{flag: true, num: 42}
        };
    }
}