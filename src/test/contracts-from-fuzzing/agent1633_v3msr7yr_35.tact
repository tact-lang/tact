/// Struct with chain of optionals inside nested structs
struct LevelOne {
    x: Int?;
}
struct LevelTwo {
    one: LevelOne?;
}
struct LevelThree {
    two: LevelTwo?;
}
contract NestedOptChain {
    nested: LevelThree;

    init() {
        self.nested = LevelThree{
            two: LevelTwo{
                one: LevelOne{
                    x: null
                }
            }
        };
    }
}