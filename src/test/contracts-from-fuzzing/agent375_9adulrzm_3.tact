struct Level3 {
    flag: Bool;
}

struct Level2 {
    lvl3: Level3;
    text: String;
}

struct Level1 {
    lvl2: Level2;
    number: Int;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            lvl2: Level2{
                lvl3: Level3{flag: true},
                text: "hi"
            },
            number: 42
        };
    }
}
