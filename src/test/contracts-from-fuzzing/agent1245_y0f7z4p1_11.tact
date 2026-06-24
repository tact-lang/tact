struct Level3 {
    num: Int;
}

struct Level2 {
    inner: Level3;
    optStr: String?;
}

struct Level1 {
    nest: Level2;
    flag: Bool;
}

contract TripleNest {
    info: Level1;

    init() {
        self.info = Level1{
            nest: Level2{
                inner: Level3{
                    num: 5,
                },
                optStr: null,
            },
            flag: true,
        };
    }
}
