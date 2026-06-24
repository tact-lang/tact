struct ComboOpt {
    i: Int?;
    s: String?;
}

struct ComboNest {
    one: ComboOpt;
    two: ComboOpt;
}

contract ComboTest {
    c: ComboNest;

    init() {
        self.c = ComboNest{
            one: ComboOpt{ i:null, s:null },
            two: ComboOpt{ i:10, s:"hi" }
        };
    }
}