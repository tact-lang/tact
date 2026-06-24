struct Level3 {
    a: Int;
    b: Bool?;
}

struct Level2 {
    nest: Level3;
    s: String;
}

struct Level1 {
    inner: Level2;
    addr: Address;
}

contract MultiLevelOptional {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{
                nest: Level3{a: 5, b: null},
                s: "deep",
            },
            addr: myAddress(),
        };
    }
}