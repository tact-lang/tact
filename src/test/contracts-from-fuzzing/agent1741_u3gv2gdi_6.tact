struct Level3 {
    val: Int?;
}

struct Level2 {
    l3opt: Level3?;
    l3: Level3;
}

struct Level1 {
    l2opt: Level2?;
    l2: Level2;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            l2opt: null,
            l2: Level2{
                l3opt: null,
                l3: Level3{val: null}
            }
        };
    }
}