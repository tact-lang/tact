struct LevelThree {
    value: Int?;
}

struct LevelTwo {
    three: LevelThree?;
}

struct LevelOne {
    two: LevelTwo?;
}

contract TestNestedOptionals {
    receive() {
        let obj: LevelOne = LevelOne{
            two: LevelTwo{
                three: LevelThree{ value: 42 }
            }
        };
    }
}
