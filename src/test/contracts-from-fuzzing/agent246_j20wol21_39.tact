struct Level4 {
    val: Int;
}
struct Level3 {
    deep: Level4;
}
struct Level2 {
    deep: Level3;
}
struct Level1 {
    deep: Level2;
}
contract DeepFour {
    base: Level1;

    init() {
        self.base = Level1{
            deep: Level2{
                deep: Level3{
                    deep: Level4{
                        val: 42,
                    }
                }
            }
        };
    }
}
