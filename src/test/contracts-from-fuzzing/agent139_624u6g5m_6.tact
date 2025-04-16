struct DeepNested {
    level1: String;
    level2: String;
    level3: String;
    level4: String;
    level5: String;
}

struct Layered {
    l1: DeepNested;
    l2: DeepNested;
}

contract NestedManyStrings {
    data: Layered;

    init() {
        self.data = Layered{
            l1: DeepNested{
                level1: "a", level2: "b", level3: "c", level4: "d", level5: "e"
            },
            l2: DeepNested{
                level1: "1", level2: "2", level3: "3", level4: "4", level5: "5"
            }
        };
    }
}