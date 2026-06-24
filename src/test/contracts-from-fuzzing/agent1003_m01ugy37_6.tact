struct Level3 {
    id: Int;
}

struct Level2 {
    child: Level3;
    value: String;
}

struct Level1 {
    child: Level2;
    active: Bool;
}

contract MultiNesting {
    deep: Level1;

    init() {
        self.deep = Level1{
            child: Level2{
                child: Level3{
                    id: 42
                },
                value: "test"
            },
            active: true
        };
    }
}