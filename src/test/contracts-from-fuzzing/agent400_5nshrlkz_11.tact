struct LevelFive {
    deep: LevelFour;
}

struct LevelFour {
    deep: LevelThree;
}

struct LevelThree {
    deep: LevelTwo;
}

struct LevelTwo {
    deep: LevelOne;
}

struct LevelOne {
    value: Int;
}

contract TestFiveDeep {
    data: LevelFive;

    init() {
        self.data = LevelFive {
            deep: LevelFour {
                deep: LevelThree {
                    deep: LevelTwo {
                        deep: LevelOne {
                            value: 123
                        }
                    }
                }
            }
        };
    }

    receive() {
        let _ = self.data.deep.deep.deep.deep.value;
    }
}