struct DeepNestedLevel3 {
    z: String;
}

struct DeepNestedLevel2 {
    y: Bool;
    l3: DeepNestedLevel3;
}

struct DeepNestedLevel1 {
    x: Int;
    l2: DeepNestedLevel2;
}

contract DeepNestedStruct {
    deep: DeepNestedLevel1;

    init() {
        self.deep = DeepNestedLevel1{
            x: 1,
            l2: DeepNestedLevel2{
                y: false,
                l3: DeepNestedLevel3{
                    z: "end",
                },
            },
        };
    }
}