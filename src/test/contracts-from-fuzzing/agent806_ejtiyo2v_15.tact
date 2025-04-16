struct Level1 {
    a: Int;
    b: Int;
    c: Level2;
}

struct Level2 {
    d: Int;
    e: Bool;
    f: Level3;
}

struct Level3 {
    g: String;
    h: Bool?;
}

contract TestContract {
    deepNested: Level1;
    init() {
        self.deepNested = Level1{
            a: 10,
            b: 20,
            c: Level2{
                d: 30,
                e: true,
                f: Level3{
                    g: "deep",
                    h: null
                }
            }
        };
    }
}