struct Level3 {
    val: Int;
}

struct Level2 {
    lvl3a: Level3;
    lvl3b: Level3;
}

struct Level1 {
    lvl2opt: Level2?;
    lvl2: Level2;
    text: String;
}

contract NestedContract {
    l1: Level1;

    init() {
        self.l1 = Level1{
            lvl2opt: null,
            lvl2: Level2{lvl3a: Level3{val: 10}, lvl3b: Level3{val: 20}},
            text: "nested",
        };
    }
}
