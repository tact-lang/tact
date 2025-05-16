struct NestedDeepDefault {
    lvl1: Lvl1Struct;
}

struct Lvl1Struct {
    lvl2: Lvl2Struct;
    a: Int = 1;
}

struct Lvl2Struct {
    lvl3: Lvl3Struct;
    b: Int = 2;
}

struct Lvl3Struct {
    c: Int = 3;
}

contract DeepDefaultTest {
    s: NestedDeepDefault;

    init() {
        self.s = NestedDeepDefault{
            lvl1: Lvl1Struct{
                lvl2: Lvl2Struct{
                    lvl3: Lvl3Struct{}
                },
                // a defaulted
            }
        };
    }
}