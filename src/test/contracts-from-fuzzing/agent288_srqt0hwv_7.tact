struct Level3 {
    deepVal: Int;
}

struct Level2 {
    middleVal: Level3;
}

struct Level1 {
    topVal: Level2;
}

contract TestContract {
    prop: Level1;

    init() {
        self.prop = Level1{
            topVal: Level2{
                middleVal: Level3{
                    deepVal: 123
                }
            }
        };
    }
}