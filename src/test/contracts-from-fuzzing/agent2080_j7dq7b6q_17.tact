struct Deep {
    lvl1: Int;
    lvl2: Lvl2;
}

struct Lvl2 {
    lvl3: Lvl3;
}

struct Lvl3 {
    val: Int;
}

contract Nested {
    d: Deep;
    init() {
        self.d = Deep{
            lvl1: 1,
            lvl2: Lvl2{
                lvl3: Lvl3{val: 42}
            }
        };
    }
}