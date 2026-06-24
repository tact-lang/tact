struct NestedDeep {
    level1: NestedLevel1;
}

struct NestedLevel1 {
    level2: NestedLevel2;
}

struct NestedLevel2 {
    level3: NestedLevel3?; // optional nested struct
}

struct NestedLevel3 {
    x: Int;
    y: Bool;
}

contract DeepStorage {
    data: NestedDeep;

    init() {
        self.data = NestedDeep{
            level1: NestedLevel1{
                level2: NestedLevel2{
                    level3: NestedLevel3{
                        x: 123,
                        y: true,
                    },
                },
            },
        };
    }
}