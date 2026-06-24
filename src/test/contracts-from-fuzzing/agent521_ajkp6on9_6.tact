struct SLevel3 {
    test: Int?;
}

struct SLevel2 {
    lvl3: SLevel3;
}

struct SLevel1 {
    lvl2: SLevel2;
}

contract DeepChain {
    storage: SLevel1;

    init() {
        self.storage = SLevel1{
            lvl2: SLevel2{
                lvl3: SLevel3{
                    test: 101,
                },
            },
        };
    }
}