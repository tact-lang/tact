struct NestedManyLevels {
    lvl1: Lvl1;
}

struct Lvl1 {
    lvl2: Lvl2;
    opt2: Lvl2?;
}

struct Lvl2 {
    lvl3: Lvl3;
}

struct Lvl3 {
    val: Int;
    flag: Bool?;
}

contract TestContract {
    d: NestedManyLevels = NestedManyLevels{
        lvl1: Lvl1{
            lvl2: Lvl2{lvl3: Lvl3{val:7, flag:null}},
            opt2: null
        }
    };
}
