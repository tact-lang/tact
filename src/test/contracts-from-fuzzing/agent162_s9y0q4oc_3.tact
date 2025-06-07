struct Combination {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optStr: String?;
    nested: NestedStruct;
}

struct NestedStruct {
    b: Bool;
    s: String;
}

contract TestContract {
    data: Combination;

    init() {
        self.data = Combination{
            intVal: 1,
            boolVal: false,
            strVal: "hello",
            optInt: null,
            optStr: "test",
            nested: NestedStruct{
                b: true,
                s: "inner"
            }
        };
    }
}