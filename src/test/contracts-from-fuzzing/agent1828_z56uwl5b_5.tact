struct Level3 {
    word: String;
}

struct Level2 {
    nested: Level3;
    flag: Bool;
}

struct Level1 {
    deep: Level2;
    number: Int;
}

contract TestContract {
    info: Level1;

    init() {
        self.info = Level1{
            deep: Level2{
                nested: Level3{
                    word: "deep"
                },
                flag: true
            },
            number: 123
        };
    }
}