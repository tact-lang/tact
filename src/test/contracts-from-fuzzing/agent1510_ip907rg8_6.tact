struct Level3 {
    s: String;
    b: Bool;
}

struct Level2 {
    l3: Level3;
    i: Int;
}

struct Level1 {
    l2: Level2;
    addr: Address;
}

contract MultiNest {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{
                l3: Level3{
                    s: "nested",
                    b: true
                },
                i: 42
            },
            addr: myAddress()
        };
    }
}