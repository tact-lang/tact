struct LevelThree {
    z: Int;
}

struct LevelTwo {
    inner: LevelThree;
}

struct LevelOne {
    inner: LevelTwo;
}

contract TestContract {
    root: LevelOne;

    init() {
        self.root = LevelOne{
            inner: LevelTwo{
                inner: LevelThree{
                    z: 999
                }
            }
        };
    }
}