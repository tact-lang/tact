struct InnerLevel3 {
    val: Int;
}

struct InnerLevel2 {
    lvl3: InnerLevel3;
    optLvl3: InnerLevel3?;
}

struct InnerLevel1 {
    lvl2: InnerLevel2;
    optLvl2: InnerLevel2?;
}

contract VeryDeepNested {
    data: InnerLevel1;

    init() {
        self.data = InnerLevel1{
            lvl2: InnerLevel2{
                lvl3: InnerLevel3{ val: 1 },
                optLvl3: null
            },
            optLvl2: null
        };
    }
}
