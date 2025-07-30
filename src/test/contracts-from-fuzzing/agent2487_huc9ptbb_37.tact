struct DeepOptional {
    lvl1: Lvl1?;
}

struct Lvl1 {
    lvl2: Lvl2?;
}

struct Lvl2 {
    lvl3: Lvl3?;
}

struct Lvl3 {
    x: Int;
}

contract TestContract {
    deep: DeepOptional;

    init() {
        self.deep = DeepOptional{
            lvl1: Lvl1{
                lvl2: null
            }
        };
    }
}