struct Level3 {
    l3val1: Int;
    l3val2: Bool;
    l3val3: Int?;
}

struct Level2 {
    l2inner: Level3;
    l2val: String;
}

struct Level1 {
    l1inner: Level2;
    l1val: Bool;
}

contract MixedNested {
    nestedData: Level1;

    init() {
        self.nestedData = Level1{
            l1inner: Level2{
                l2inner: Level3{
                    l3val1: 10,
                    l3val2: true,
                    l3val3: 99,
                },
                l2val: "world",
            },
            l1val: false,
        };
    }
}
