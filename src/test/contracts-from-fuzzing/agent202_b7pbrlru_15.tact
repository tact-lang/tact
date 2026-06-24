struct VeryDeep {
    lvl1: Lvl1;
}

struct Lvl1 {
    lvl2: Lvl2;
}

struct Lvl2 {
    lvl3: Lvl3;
}

struct Lvl3 {
    val: Int;
    flag: Bool;
}

contract SuperDeepStruct {
    s: VeryDeep;
    init() {
        self.s = VeryDeep{
            lvl1: Lvl1{
                lvl2: Lvl2{
                    lvl3: Lvl3{
                        val: 123,
                        flag: true
                    }
                }
            }
        };
    }
    receive() {
        let _ = self.s.lvl1.lvl2.lvl3.val;
    }
}