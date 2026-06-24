struct Level1 {
    a: Int;
    b: Bool;
}

struct Level2 {
    l1: Level1;
    opt: String?;
}

struct Level3 {
    l2: Level2;
    addr: Address;
}

contract MultiNestOpt {
    data: Level3;

    init() {
        self.data = Level3{
            l2: Level2{
                l1: Level1{
                    a: 7,
                    b: false
                },
                opt: null
            },
            addr: myAddress()
        };
    }
}