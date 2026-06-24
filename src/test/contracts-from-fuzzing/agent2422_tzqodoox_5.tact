struct VeryDeep {
    level1: Int;
    level2: Int;
    level3: Int;
    level4: Int;
    level5: Int;
}

struct Wrapper {
    deep: VeryDeep;
}

contract TestContract {
    w: Wrapper;
    
    init() {
        self.w = Wrapper{
            deep: VeryDeep{
                level1: 1,
                level2: 2,
                level3: 3,
                level4: 4,
                level5: 5
            }
        };
    }
}