struct Deep {
    next: Level;
}

struct Level {
    val: Int;
}

struct Combo {
    n1: Int;
    nested: Deep;
    flag: Bool;
    note: String;
}

contract ComboStore {
    all: Combo;

    init() {
        self.all = Combo{
            n1: 77,
            nested: Deep{ next: Level{ val: 88 } },
            flag: true,
            note: "done"
        };
    }
}