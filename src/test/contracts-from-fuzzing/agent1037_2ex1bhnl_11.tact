struct OptionalManyNested {
    opt: Level1?;
}

struct Level1 {
    lvl2: Level2?;
}

struct Level2 {
    lvl3: Level3?;
}

struct Level3 {
    lvl4: Level4?;
}

struct Level4 {
    foo: Int?;
}

contract TestContract {
    persistent: OptionalManyNested;

    init() {
        self.persistent = OptionalManyNested{
            opt: Level1{
                lvl2: Level2{
                    lvl3: Level3{
                        lvl4: Level4{
                            foo: 77
                        }
                    }
                }
            }
        };
    }
}