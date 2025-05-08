struct Level3 {
    a: Int;
    b: String;
}

struct Level2 {
    c: Level3;
    d: Int?;
}

struct Level1 {
    e: Level2;
    f: Bool;
}

contract DeepFields {
    data: Level1;

    init() {
        self.data = Level1{
            e: Level2{
                c: Level3{
                    a: 7,
                    b: "test"
                },
                d: null
            },
            f: true
        };
    }
}