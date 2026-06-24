struct Level3 {
    addr: Address?;
}

struct Level2 {
    foo: Level3?;
    count: Int as uint8;
}

struct Level1 {
    bar: Level2;
    big: Int as uint256;
}

contract DeepMix {
    thing: Level1;

    init() {
        self.thing = Level1{
            bar: Level2{
                foo: Level3{ addr: null },
                count: 5,
            },
            big: 789,
        };
    }
}