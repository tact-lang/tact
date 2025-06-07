struct Level3 {
    a: Int?;
    b: Bool;
    c: String;
}

struct Level2 {
    sub: Level3;
    flag: Bool;
}

struct Level1 {
    sub: Level2;
    number: Int;
}

contract TestContract {
    top: Level1;
    init() {
        self.top = Level1{
            sub: Level2{
                sub: Level3{a: null, b: true, c: "deep"},
                flag: false
            },
            number: 42
        };
    }
}