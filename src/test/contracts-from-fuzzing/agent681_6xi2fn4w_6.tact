struct Level3 {
    flag: Bool;
    t: String;
}

struct Level2 {
    inner: Level3;
    n: Int?;
}

struct Level1 {
    child: Level2?;
    more: String;
}

contract DeepOpt {
    data: Level1;

    init() {
        self.data = Level1{
            child: Level2{
                inner: Level3{flag: false, t: "xyz"},
                n: null
            },
            more: "hi"
        };
    }
}
