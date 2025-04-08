struct Level1 {
    l2: Level2;
}

struct Level2 {
    l3: Level3;
}

struct Level3 {
    l4: Level4;
}

struct Level4 {
    l5: Level5;
}

struct Level5 {
    val: Int;
    flag: Bool;
}

contract DeepNest {
    value: Level1;

    init() {
        self.value = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{
                        l5: Level5{
                            val: 999,
                            flag: true
                        }
                    }
                }
            }
        };
    }
}
