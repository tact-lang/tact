struct DeepNest {
    level1: Level1;
}
struct Level1 {
    level2: Level2;
}
struct Level2 {
    level3: Level3?;
}
struct Level3 {
    value: Int?;
}

contract TestContract {
    dn: DeepNest;

    init() {
        self.dn = DeepNest{
            level1: Level1{
                level2: Level2{
                    level3: Level3{ value: null },
                },
            },
        };
    }

    receive() {
        let _ = self.dn.level1.level2.level3;
    }
}