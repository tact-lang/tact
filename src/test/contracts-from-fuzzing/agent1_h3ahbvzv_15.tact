struct Level3 {
    val: String;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract TestContract {
    hierarchy: Level1;

    init() {
        self.hierarchy = Level1{
            l2: Level2{
                l3: Level3{
                    val: "deep"
                }
            }
        };
    }
}