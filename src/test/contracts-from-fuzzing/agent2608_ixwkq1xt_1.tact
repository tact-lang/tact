struct DeepNested {
    sub: Level1;
}

struct Level1 {
    sub: Level2?;
}

struct Level2 {
    sub: Level3?;
}

struct Level3 {
    sub: Level4?;
}

struct Level4 {
    sub: Level5?;
}

struct Level5 {
    val: Int?;
}

contract TestContract {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            sub: Level1{
                sub: Level2{
                    sub: Level3{
                        sub: Level4{
                            sub: Level5{ val: 42 }
                        }
                    }
                }
            }
        };
    }
}
