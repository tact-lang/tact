struct Level3 {
    flag: Bool;
}

struct Level2 {
    l3: Level3;
    text: String?;
}

struct Level1 {
    l2: Level2;
}

contract MultiLevel {
    data: Level1;

    init() {
        self.data = Level1{
            l2: Level2{
                l3: Level3{
                    flag: true
                },
                text: null
            }
        };
    }
}