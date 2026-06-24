struct LargeNest1 {
    a: Int;
}

struct LargeNest2 {
    b: LargeNest1;
}

struct LargeNest3 {
    c: LargeNest2;
}

struct LargeNest4 {
    d: LargeNest3;
}

struct LargeNest5 {
    e: LargeNest4;
}

struct LargeNest6 {
    f: LargeNest5;
}

struct LargeNest7 {
    g: LargeNest6;
}

contract LargeDeepNestTest {
    val: LargeNest7 = LargeNest7{
        g: LargeNest6{
            f: LargeNest5{
                e: LargeNest4{
                    d: LargeNest3{
                        c: LargeNest2{
                            b: LargeNest1{ a:10 }
                        }
                    }
                }
            }
        }
    };
}