struct NestedOptionalDeep {
    lvl1: Lvl1?;
}

struct Lvl1 {
    lvl2: Lvl2?;
}

struct Lvl2 {
    val: Int;
}

contract TestContract {
    deepOpt: NestedOptionalDeep;

    init() {
        self.deepOpt = NestedOptionalDeep{
            lvl1: Lvl1{
                lvl2: Lvl2{
                    val: 777
                }
            }
        };
    }
}