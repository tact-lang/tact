struct Level3 {
    f3: Int;
}
struct Level2 {
    f2: Level3;
}
struct Level1 {
    f1: Level2;
}

contract DeeplyNestedContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            f1: Level2{
                f2: Level3{
                    f3: 999
                }
            }
        };
    }
}
