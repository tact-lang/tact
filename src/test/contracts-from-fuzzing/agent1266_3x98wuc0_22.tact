struct LevelOne {
    a: Int;
}
struct LevelTwo {
    one: LevelOne;
    b: Int;
}
struct LevelThree {
    two: LevelTwo;
    c: Int;
}
contract ThreeLevels {
    test: LevelThree;
    init() {
        self.test = LevelThree{
            two: LevelTwo{
                one: LevelOne{a:1},
                b:2
            },
            c:3
        };
    }
}