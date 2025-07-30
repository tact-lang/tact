struct Level3 {
    leaf: Int;
}

struct Level2 {
    middle: Level3;
}

struct Level1 {
    root: Level2;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            root: Level2{
                middle: Level3{
                    leaf: 777
                }
            }
        };
    }
}