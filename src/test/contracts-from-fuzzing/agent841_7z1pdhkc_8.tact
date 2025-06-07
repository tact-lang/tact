struct Level3 {
    leafVal: Int = 99;
    leafFlag: Bool = true;
}

struct Level2 {
    midVal: Int = 50;
    nested3: Level3;
}

struct Level1 {
    rootVal: Int = 10;
    nested2: Level2;
}

contract TestContract {
    universe: Level1;

    init() {
        self.universe = Level1{
            rootVal: 11,
            nested2: Level2{
                midVal: 22,
                nested3: Level3{
                    leafVal: 33,
                    leafFlag: false,
                },
            },
        };
    }
}
