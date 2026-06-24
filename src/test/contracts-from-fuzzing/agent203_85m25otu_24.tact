struct DeepDefaults {
    l1: Level1;
}

struct Level1 {
    l2: Level2;
}

struct Level2 {
    l3: Level3;
}

struct Level3 {
    flag: Bool = true;
    number: Int? = null;
    str: String = "hi";
}

contract TestContract {
    field: DeepDefaults;

    init() {
        self.field = DeepDefaults{
            l1: Level1{
                l2: Level2{
                    l3: Level3{},
                },
            },
        };
    }
}