struct Level3 {
    optInt: Int?;
}

struct Level2 {
    inner3: Level3;
}

struct Level1 {
    inner2: Level2;
}

contract OptionalDeep {
    data: Level1;

    init() {
        self.data = Level1{
            inner2: Level2{
                inner3: Level3{
                    optInt: null
                }
            }
        };
    }
}