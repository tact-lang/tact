struct BigNestedStruct {
    l1: Int;
    l2: LevelTwo;
}

struct LevelTwo {
    l3: Int;
    l4: LevelThree;
}

struct LevelThree {
    l5: Int;
    l6: Int;
}

contract NestedBigTest {
    val: BigNestedStruct;

    init() {
        self.val = BigNestedStruct{
            l1: 1,
            l2: LevelTwo{
                l3: 3,
                l4: LevelThree{ l5:5, l6:6 },
            },
        };
    }
}