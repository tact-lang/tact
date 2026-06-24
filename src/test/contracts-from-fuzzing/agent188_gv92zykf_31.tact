struct LevelOne {
    val: Int;
    next: LevelTwo;
}

struct LevelTwo {
    val2: Int?;
    next: LevelThree;
}

struct LevelThree {
    val3: Bool?;
}

contract ComplexChain {
    data: LevelOne;
    
    init() {
        self.data = LevelOne{
            val:5,
            next: LevelTwo{
                val2:null,
                next: LevelThree{
                    val3:null
                }
            }
        };
    }
}
