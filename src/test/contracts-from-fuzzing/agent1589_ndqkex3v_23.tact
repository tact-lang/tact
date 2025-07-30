struct DeepOptionals {
    l1: Int?;
    l2: Int?;
    nested: Level2?;
}

struct Level2 {
    l3: Int?;
    l4: Bool?;
    inner: Level3?;
}

struct Level3 {
    l5: Int?;
    l6: String?;
}

contract DeepNestedOptionals {
    data: DeepOptionals;

    init() {
        self.data = DeepOptionals{
            l1: null,
            l2: 2,
            nested: Level2{
                l3: null,
                l4: true,
                inner: Level3{
                    l5: 5,
                    l6: null
                }
            }
        };
    }
}