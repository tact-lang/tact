struct DeeplyNestedLevel3 {
    x: Int;
    y: Bool;
}

struct DeeplyNestedLevel2 {
    level3: DeeplyNestedLevel3;
    flag: Bool;
}

struct DeeplyNested {
    level2: DeeplyNestedLevel2;
    name: String;
}

contract TestContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            level2: DeeplyNestedLevel2{
                level3: DeeplyNestedLevel3{
                    x: 42, y: true
                },
                flag: false
            },
            name: "deep"
        };
    }
}