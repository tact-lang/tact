struct Level3 {
    data: Int;
}

struct Level2 {
    lvl3: Level3?;
    label: String;
}

struct Level1 {
    lvl2: Level2;
    status: Bool;
}

contract NestedMix {
    nested: Level1;

    init() {
        self.nested = Level1{
            lvl2: Level2{
                lvl3: null,
                label: "inner"
            },
            status: true
        };
    }
}