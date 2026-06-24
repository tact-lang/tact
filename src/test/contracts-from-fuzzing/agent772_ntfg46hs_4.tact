struct LargeNested {
    a: Int;
    b: Bool;
    c: Level2;
}

struct Level2 {
    d: Bool;
    e: Level3;
}

struct Level3 {
    f: Int;
    g: Bool;
}

contract TestContract {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            a: 10,
            b: true,
            c: Level2{
                d: false,
                e: Level3{
                    f: 20,
                    g: true,
                },
            },
        };
    }
}