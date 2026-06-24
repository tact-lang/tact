struct Level3 {
    val: Int;
}

struct Level2 {
    l3: Level3;
    optL3: Level3?;
}

struct Level1 {
    l2: Level2;
}

contract DeepOptional {
    data: Level1;

    init() {
        self.data = Level1{
            l2: Level2{
                l3: Level3{ val: 5 },
                optL3: null
            }
        };
    }
}