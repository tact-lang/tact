struct Level3 {
    flag: Bool;
    count: Int;
}

struct Level2 {
    num: Int;
    lvl3opt: Level3?;
}

struct Level1 {
    lvl2opt: Level2?;
    name: String;
}

contract OptionalNested {
    data: Level1;
    init() {
        self.data = Level1{
            lvl2opt: null,
            name: "optional"
        };
    }
}