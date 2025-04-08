struct DeepNested {
    a: Int;
    b: Bool;
    c: Level2;
}

struct Level2 {
    d: Int?;
    e: Bool;
    f: Level3;
}

struct Level3 {
    g: Int;
    h: Bool?;
}

contract Test {
    payload: DeepNested;

    init() {
        self.payload = DeepNested{
            a: 1,
            b: false,
            c: Level2{
                d: null,
                e: true,
                f: Level3{
                    g: 100,
                    h: null,
                }
            }
        };
    }
}
