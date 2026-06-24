struct Level3 {
    x: Int;
    y: Int;
}

struct Level2 {
    inner: Level3;
    flag: Bool;
}

struct Level1 {
    inner: Level2;
    text: String;
}

contract MultiLevel {
    storage: Level1;

    init() {
        self.storage = Level1{
            inner: Level2{
                inner: Level3{ x: 1, y: 2 },
                flag: true
            },
            text: "hi"
        };
    }
}