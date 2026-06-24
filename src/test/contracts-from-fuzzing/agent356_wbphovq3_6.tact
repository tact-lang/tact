struct SLevel3 {
    leaf: Int;
}

struct SLevel2 {
    mid: SLevel3;
}

struct SLevel1 {
    root: SLevel2;
}

contract LevelTest {
    storage: SLevel1;

    init() {
        self.storage = SLevel1{
            root: SLevel2{
                mid: SLevel3{
                    leaf: 777
                }
            }
        };
    }
}