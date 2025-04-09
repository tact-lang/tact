struct Level3 {
    n: Int;
    b: Bool;
    s: String;
}

struct Level2 {
    inner: Level3;
    flag: Bool;
}

struct Level1 {
    nested: Level2;
    num: Int;
}

contract DeepChain {
    root: Level1 = Level1{
        nested: Level2{
            inner: Level3{ n: 1, b: true, s: "x" },
            flag: false
        },
        num: 9
    };

    init() {
        self.root = Level1{
            nested: Level2{
                inner: Level3{ n: 2, b: false, s: "y" },
                flag: true
            },
            num: 99
        };
    }
}