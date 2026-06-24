struct NestedLevel3 {
    deep: Int;
    optional: Bool?;
}

struct NestedLevel2 {
    nested3: NestedLevel3;
    value2: Int;
}

struct NestedLevel1 {
    nested2: NestedLevel2;
    value1: Bool;
}

contract DeepNesting {
    all: NestedLevel1;

    init() {
        self.all = NestedLevel1{
            nested2: NestedLevel2{
                nested3: NestedLevel3{
                    deep: 999,
                    optional: null
                },
                value2: 42
            },
            value1: true
        };
    }
}
