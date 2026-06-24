struct Level3 {
    innermost: Int;
    flag: Bool;
    word: String;
}

struct Level2 {
    nested1: Level3;
    nested2: Level3;
}

struct Level1 {
    innerA: Level2;
    innerB: Level2;
}

contract DeepNesting {
    val: Level1;

    init() {
        self.val = Level1{
            innerA: Level2{
                nested1: Level3{ innermost: 1, flag: true, word: "a" },
                nested2: Level3{ innermost: 2, flag: false, word: "b" }
            },
            innerB: Level2{
                nested1: Level3{ innermost: 3, flag: true, word: "c" },
                nested2: Level3{ innermost: 4, flag: false, word: "d" }
            }
        };
    }
}