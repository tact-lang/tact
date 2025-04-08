struct Level3 {
    leaf: Int?;
    flag: Bool;
}

struct Level2 {
    inner: Level3;
    txt: String;
}

struct Level1 {
    node: Level2;
    num: Int;
}

contract TestContract {
    root: Level1;

    init() {
        self.root = Level1{
            node: Level2{
                inner: Level3{
                    leaf: null,
                    flag: true
                },
                txt: "deep"
            },
            num: 55
        };
    }
}