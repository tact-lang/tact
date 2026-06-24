struct Level3 {
    x: Int = 3;
    y: Bool = false;
}

struct Level2 {
    inner3: Level3?;
    s: String = "hi";
}

struct Level1 {
    inner2: Level2;
    b: Bool?;
}

contract MultiLevelNested {
    storage: Level1;

    init() {
        self.storage = Level1{
            inner2: Level2{
                inner3: null,
                s: "hello"
            },
            b: null
        };
    }
}