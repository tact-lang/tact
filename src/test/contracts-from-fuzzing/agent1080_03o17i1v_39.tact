struct Layered {
    lvl1: Int;
    lvl2: Nested1;
}

struct Nested1 {
    lvl3: Nested2;
    x: Int;
}

struct Nested2 {
    lvl4: Int;
    lvl5: Int;
}

contract LayerContract {
    data: Layered;

    init() {
        self.data = Layered{
            lvl1: 1,
            lvl2: Nested1{
                lvl3: Nested2{ lvl4: 4, lvl5: 5 },
                x: 2,
            },
        };
    }
}