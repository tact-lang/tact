struct LevelFive {
    leaf: Int;
}
struct LevelFour {
    node: LevelFive;
}
struct LevelThree {
    node: LevelFour;
}
struct LevelTwo {
    node: LevelThree;
}
struct LevelOne {
    node: LevelTwo;
}

contract DepthTest {
    deep: LevelOne;

    init() {
        self.deep = LevelOne{
            node: LevelTwo{
                node: LevelThree{
                    node: LevelFour{
                        node: LevelFive{leaf: 555}
                    }
                }
            }
        };
    }
}