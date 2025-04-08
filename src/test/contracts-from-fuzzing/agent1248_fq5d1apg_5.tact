struct Level3 {
    flag: Bool?;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2?;
}

contract MultiOptTest {
    s: Level1;

    init() {
        self.s = Level1{
            l2: Level2{
                l3: Level3{flag:true}
            }
        };
    }
}
