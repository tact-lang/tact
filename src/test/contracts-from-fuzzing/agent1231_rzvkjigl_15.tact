struct OptionalDeepNested {
    lvl2: Level2?;
}

struct Level2 {
    lvl3: Level3?;
}

struct Level3 {
    lvl4: Level4?;
}

struct Level4 {
    lvl5: Level5?;
}

struct Level5 {
    value: Int?;
}

contract TestContract {
    data: OptionalDeepNested;
    
    init() {
        self.data = OptionalDeepNested{
            lvl2: Level2{
                lvl3: Level3{
                    lvl4: Level4{
                        lvl5: Level5{value: 123}
                    }
                }
            }
        };
    }
}
