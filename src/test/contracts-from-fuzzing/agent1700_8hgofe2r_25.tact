struct Level2 {
    deep: Int;
}

struct Level1 {
    mid: Level2;
    flag: Bool;
}

struct Root {
    top: Level1;
    text: String?;
}

contract TestContract {
    r: Root;

    init() {
        self.r = Root{
            top: Level1{mid: Level2{deep: 1}, flag: false},
            text: null
        };
    }
}