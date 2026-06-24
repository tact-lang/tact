struct DeepNest {
    f1: Int;
    f2: Bool?;
    f3: String;
    f4: InnerStruct;
}

struct InnerStruct {
    sub1: Int;
    sub2: Bool?;
    sub3: String;
}

contract DeepNestedStorage {
    field: DeepNest;
    init() {
        self.field = DeepNest{
            f1: 2,
            f2: true,
            f3: "hello",
            f4: InnerStruct{
                sub1: 1,
                sub2: null,
                sub3: "abc"
            }
        };
    }
}