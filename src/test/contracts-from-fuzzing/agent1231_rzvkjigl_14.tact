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
    x: Int;
}

contract TestContract {
    deep: Level1;

    init() {
        self.deep = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{
                        l5: Level5{x: 99}
                    }
                }
            }
        };
    }
}
