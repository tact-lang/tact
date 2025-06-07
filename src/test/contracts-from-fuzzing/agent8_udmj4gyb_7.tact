struct Level4 {
    val: Int;
}

struct Level3 {
    l4: Level4?;
    flag: Bool;
}

struct Level2 {
    l3: Level3;
    text: String?;
}

struct Level1 {
    l2: Level2?;
    addr: Address;
}

contract TestContract {
    root: Level1;

    init() {
        self.root = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{
                        val: 7,
                    },
                    flag: true
                },
                text: null
            },
            addr: myAddress()
        };
    }
}
