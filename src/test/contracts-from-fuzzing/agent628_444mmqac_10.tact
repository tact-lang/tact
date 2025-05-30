struct Level1 {
    level2: Level2;
    info: String;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    flag: Bool;
    text: String;
}

contract ManyNested {
    root: Level1;

    init() {
        self.root = Level1{
            level2: Level2{ level3: Level3{ flag:true, text:"hi" } },
            info: "root"
        };
    }
}