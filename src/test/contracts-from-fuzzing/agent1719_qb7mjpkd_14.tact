struct Level3 {
    score: Int?;
    note: String;
}

struct Level2 {
    deeper: Level3;
    flag: Bool?;
}

struct Level1 {
    inner: Level2;
    title: String;
}

contract Deep3Structs {
    s: Level1;

    init() {
        self.s = Level1{
            inner: Level2{
                deeper: Level3{
                    score: null,
                    note: "leaf"
                },
                flag: true
            },
            title: "root"
        };
    }
}