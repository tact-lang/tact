struct LargeNestLevel1 {
    a: Int;
    b: Bool;
}

struct LargeNestLevel2 {
    c: LargeNestLevel1;
    d: LargeNestLevel1;
}

struct LargeNestLevel3 {
    e: LargeNestLevel2;
    f: LargeNestLevel2;
}

contract LargeDeepTest {
    val: LargeNestLevel3;

    init() {
        self.val = LargeNestLevel3{
            e: LargeNestLevel2{
                c: LargeNestLevel1{a:1,b:true},
                d: LargeNestLevel1{a:2,b:false}
            },
            f: LargeNestLevel2{
                c: LargeNestLevel1{a:3,b:true},
                d: LargeNestLevel1{a:4,b:false}
            }
        };
    }
}