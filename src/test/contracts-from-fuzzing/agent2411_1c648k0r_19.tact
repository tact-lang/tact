struct Level3 {
    flag: Bool;
}

struct Level2 {
    inner: Level3;
    count: Int;
}

struct Level1 {
    inner: Level2;
    text: String;
}

contract ComplexNested {
    storage: Level1;

    init() {
        self.storage = Level1{
            inner: Level2{
                inner: Level3{flag: true},
                count: 99
            },
            text: "Nested!"
        };
    }
}