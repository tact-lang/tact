struct Level3 {
    a: Int;
    b: Bool?;
}

struct Level2 {
    inner: Level3;
    data: String?;
}

struct Level1 {
    sub: Level2;
    flag: Bool;
}

contract Test {
    top: Level1;

    init() {
        self.top = Level1{
            sub: Level2{
                inner: Level3{ a: 2, b: null },
                data: null
            },
            flag: true
        };
    }
}