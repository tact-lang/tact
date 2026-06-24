struct Lvl3 {
    v: Int;
}

struct Lvl2 {
    l3: Lvl3;
}

struct Lvl1 {
    l2: Lvl2;
}

contract DeepAssignTest {
    nested: Lvl1;

    init() {
        self.nested = Lvl1{l2:Lvl2{l3:Lvl3{v:99}}};
    }

    receive() {
        let _ = self.nested.l2.l3.v + 1;
    }
}