struct Level3 {
    s: String;
    i: Int;
}

struct Level2 {
    nested3: Level3;
    b: Bool;
}

struct Level1 {
    nested2: Level2;
    c: Cell;
}

contract MultiNested {
    data: Level1;

    init() {
        self.data = Level1{
            nested2: Level2{
                nested3: Level3{
                    s: "hi",
                    i: 5,
                },
                b: true,
            },
            c: emptyCell(),
        };
    }
}