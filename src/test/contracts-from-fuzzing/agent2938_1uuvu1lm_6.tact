struct OptNestedDeep {
    lvl2: OptLvl2?;
}

struct OptLvl2 {
    lvl3: OptLvl3?;
}

struct OptLvl3 {
    lvl4: Int?;
}

contract OptionalDeepChain {
    data: OptNestedDeep;
    init() {
        self.data = OptNestedDeep{
            lvl2: OptLvl2{
                lvl3: OptLvl3{
                    lvl4: 999
                }
            }
        };
    }
}