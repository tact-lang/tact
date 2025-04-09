struct Level3 {
    n: Int;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2?;
}

contract TopOptionals {
    top: Level1?;

    init() {
        self.top = Level1{
            l2: Level2{
                l3: Level3{
                    n: 123
                }
            }
        };
    }
}