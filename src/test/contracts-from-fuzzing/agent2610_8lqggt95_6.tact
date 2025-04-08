struct BoolLayer1 {
    lvl2: BoolLayer2;
}

struct BoolLayer2 {
    lvl3: BoolLayer3;
}

struct BoolLayer3 {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
}

contract TestContract {
    nestedFlags: BoolLayer1;
    init() {
        self.nestedFlags = BoolLayer1{
            lvl2: BoolLayer2{
                lvl3: BoolLayer3{ flag1:true, flag2:false, flag3:true }
            }
        };
    }
}
