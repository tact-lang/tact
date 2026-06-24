struct NestedStruct {
    innermost: String;
}

struct MiddleStruct {
    nested: NestedStruct;
    flag: Bool;
}

contract TestContract {
    s: MiddleStruct;

    init() {
        self.s = MiddleStruct{
            nested: NestedStruct{
                innermost: "deep"
            },
            flag: true,
        };
    }
}