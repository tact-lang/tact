struct Level3 {
    flag: Bool;
}

struct Level2 {
    num: Int;
    lvl3: Level3;
}

struct Level1 {
    text: String;
    opt: Level2?;
}

contract TestContract {
    nested: Level1;
    
    init() {
        self.nested = Level1{
            text: "foo",
            opt: Level2{ num: 7, lvl3: Level3{ flag: true } },
        };
    }
}