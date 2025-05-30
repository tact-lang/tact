struct DeeplyNested {
    s1: Level1Optionals?;
}

struct Level1Optionals {
    s2: Level2Inner?;
    simple: Int?;
}

struct Level2Inner {
    flag: Bool?;
    text: String?;
}

contract VeryDeepOptionals {
    nestedField: DeeplyNested;

    init() {
        self.nestedField = DeeplyNested{
            s1: Level1Optionals{
                s2: Level2Inner{
                    flag: null,
                    text: null,
                },
                simple: null,
            }
        };
    }
}