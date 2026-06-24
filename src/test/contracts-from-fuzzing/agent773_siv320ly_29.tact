struct SLevel1 {
    lev2: SLevel2;
}

struct SLevel2 {
    lev3: SLevel3;
}

struct SLevel3 {
    lev4: SLevel4;
}

struct SLevel4 {
    val: Int;
}

contract NestedFour {
    deep: SLevel1;

    init() {
        self.deep = SLevel1{
            lev2: SLevel2{
                lev3: SLevel3{
                    lev4: SLevel4{
                        val: 999,
                    }
                }
            }
        };
    }
}