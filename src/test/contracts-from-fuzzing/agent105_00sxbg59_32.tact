struct InnerMost {
    val: Int;
}
struct Level1 {
    nested: InnerMost;
}
struct Level2 {
    nested: Level1;
}
struct Level3 {
    nested: Level2;
}
contract Nested3 {
    val: Level3;
    init() {
        self.val = Level3{
            nested: Level2{
                nested: Level1{
                    nested: InnerMost{
                        val: 888,
                    },
                },
            },
        };
    }
}