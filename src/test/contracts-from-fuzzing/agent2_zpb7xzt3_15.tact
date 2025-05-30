struct Level3 {
    x: Int;
    y: String?;
}

struct Level2 {
    m: Level3?;
    flag: Bool;
}

struct Level1 {
    n: Level2?;
    num: Int;
}

contract TestContract {
    deep: Level1;
    init() {
        self.deep = Level1{
            n: Level2{
                m: null,
                flag: true
            },
            num: 99
        };
    }
}