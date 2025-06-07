struct Level3 {
    z: Int;
}

struct Level2 {
    inner3: Level3;
}

struct Level1 {
    inner2: Level2;
}

contract DeepNesting {
    data: Level1;

    init() {
        self.data = Level1{
            inner2: Level2{
                inner3: Level3{ z: 77 }
            }
        };
    }
}
