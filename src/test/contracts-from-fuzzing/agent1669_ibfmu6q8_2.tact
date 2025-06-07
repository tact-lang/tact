struct Level3 {
    i: Int;
    b: Bool;
}

struct Level2 {
    lvl3: Level3;
    s: String;
}

struct DeepNested {
    lvl2: Level2;
    flag: Bool;
}

contract DeepStorage {
    nested: DeepNested;
    counter: Int as uint32;
    flag: Bool;
    text: String;
    cellVal: Cell;

    init() {
        self.counter = 0;
        self.flag = true;
        self.text = "hi";
        self.cellVal = emptyCell();
        self.nested = DeepNested{
            lvl2: Level2{
                lvl3: Level3{ i: 42, b: false },
                s: "deep",
            },
            flag: false,
        };
    }
}