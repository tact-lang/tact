struct Level3 {
    d: Int;
}

struct Level2 {
    c: Bool;
    inner3: Level3;
}

struct Level1 {
    b: String;
    inner2: Level2;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            b: "deep",
            inner2: Level2{
                c: true,
                inner3: Level3{
                    d: 99,
                },
            },
        };
    }
}