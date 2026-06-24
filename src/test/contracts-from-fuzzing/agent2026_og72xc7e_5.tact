struct NestedStruct {
    outerValue: Int;
    nested: NestedInner;
}

struct NestedInner {
    innerValue: Int;
    flag: Bool;
    deep: Deepest;
}

struct Deepest {
    message: String;
    number: Int;
}

contract TestContract {
    field: NestedStruct;

    init() {
        self.field = NestedStruct{
            outerValue: 1,
            nested: NestedInner{
                innerValue: 2,
                flag: true,
                deep: Deepest{
                    message: "hello",
                    number: 3
                }
            }
        };
    }
}