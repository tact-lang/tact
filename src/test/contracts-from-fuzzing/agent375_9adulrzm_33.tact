struct DeepOptional {
    lvl1: Lvl1?;
    finalVal: Int;
}

struct Lvl1 {
    lvl2: Lvl2?;
}

struct Lvl2 {
    lvl3: Lvl3?;
}

struct Lvl3 {
    value: Int;
}

contract TestContract {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            lvl1: Lvl1{
                lvl2: Lvl2{
                    lvl3: Lvl3{value:123}
                }
            },
            finalVal: 999
        };
    }
}
