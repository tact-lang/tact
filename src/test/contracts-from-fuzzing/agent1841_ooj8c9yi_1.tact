struct DeeplyNested {
    inner: LevelOne;
}

struct LevelOne {
    inner: LevelTwo;
}

struct LevelTwo {
    inner: LevelThree;
}

struct LevelThree {
    value: Int;
}

contract TestContract {
    data: DeeplyNested;
    
    init() {
        self.data = DeeplyNested{
            inner: LevelOne{
                inner: LevelTwo{
                    inner: LevelThree{value: 42}
                }
            }
        };
    }
}
