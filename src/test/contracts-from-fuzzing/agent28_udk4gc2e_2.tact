struct DeeplyNested {
    lvl1: Lvl1;
}

struct Lvl1 {
    lvl2: Lvl2;
}

struct Lvl2 {
    lvl3: Lvl3;
}

struct Lvl3 {
    lvl4: Lvl4?;
}

struct Lvl4 {
    value: Int;
}

contract TestContract {
    field: DeeplyNested;

    init() {
        self.field = DeeplyNested{
            lvl1: Lvl1{
                lvl2: Lvl2{
                    lvl3: Lvl3{
                        lvl4: null,
                    },
                },
            },
        };
    }
}