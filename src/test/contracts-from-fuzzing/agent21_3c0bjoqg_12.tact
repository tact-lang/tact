struct NestedDefaults {
    level1: Level1;
}

struct Level1 {
    value: Int = 999;
    nextLevel: Level2;
}

struct Level2 {
    text: String = "default";
}

contract TestContract {
    nestedDef: NestedDefaults;

    init() {
        self.nestedDef = NestedDefaults{
            level1: Level1{
                nextLevel: Level2{}
            }
        };
    }
}