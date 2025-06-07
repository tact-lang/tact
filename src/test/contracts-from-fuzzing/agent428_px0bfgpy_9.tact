struct DeeplyNestedOptionals {
    x: Int?;
    l1: Level1?;
}

struct Level1 {
    name: String;
    l2: Level2?;
}

struct Level2 {
    value: Int?;
    flag: Bool?;
    l3: Level3?;
}

struct Level3 {
    data: String?;
    finalInt: Int;
}

contract DeepNestOpt {
    store: DeeplyNestedOptionals;

    init() {
        self.store = DeeplyNestedOptionals{
            x: null,
            l1: Level1{
                name: "foo",
                l2: Level2{
                    value: null,
                    flag: true,
                    l3: Level3{
                        data: null,
                        finalInt: 6
                    }
                }
            }
        };
    }
}
