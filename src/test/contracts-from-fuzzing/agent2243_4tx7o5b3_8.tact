struct Level3 {
    i: Int;
    b: Bool;
}

struct Level2 {
    x: Int;
    y: Level3;
}

struct Level1 {
    foo: Level2;
    bar: Int;
}

contract ChainStructs {
    data: Level1;

    init() {
        self.data = Level1{
            foo: Level2{
                x: 100,
                y: Level3 {
                    i: 1,
                    b: false
                }
            },
            bar: 200
        };
    }
}
