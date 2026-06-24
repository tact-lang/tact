struct Level3 {
    val: Int;
}

struct Level2 {
    l3: Level3;
    opt: Int?;
}

struct Level1 {
    l2: Level2;
    flag: Bool;
}

contract DeepChain {
    data: Level1;

    init() {
        self.data = Level1{
            l2: Level2{
                l3: Level3{
                    val: 42
                },
                opt: null
            },
            flag: true
        };
    }
}