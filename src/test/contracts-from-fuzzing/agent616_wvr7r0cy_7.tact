struct Level3 {
    val: String?;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepTower {
    tower: Level1;

    init() {
        self.tower = Level1{
            l2: Level2{
                l3: Level3{val: null}
            }
        };
    }
}