struct NestDeep5 {
    lvl5: Int;
}
struct NestDeep4 {
    lvl4: NestDeep5;
}
struct NestDeep3 {
    lvl3: NestDeep4;
}
struct NestDeep2 {
    lvl2: NestDeep3;
}
struct NestDeep1 {
    lvl1: NestDeep2;
}

contract VeryDeepNested {
    deep: NestDeep1;

    init() {
        self.deep = NestDeep1{
            lvl1: NestDeep2{
                lvl2: NestDeep3{
                    lvl3: NestDeep4{
                        lvl4: NestDeep5{ lvl5: 42 }
                    }
                }
            }
        };
    }
}