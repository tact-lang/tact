struct Level1 {
    flag: Bool;
}

struct Level2 {
    lvl1: Level1;
}

message(42) Ping {
    txt: String;
}

struct Combo {
    nested: Level2;
    msg: Ping;
    note: String;
}

contract ComboTest {
    c: Combo;

    init() {
        self.c = Combo{
            nested: Level2{ lvl1: Level1{ flag: true } },
            msg: Ping{ txt: "hi" },
            note: "done"
        };
    }

    receive() {}
}