struct Deeply {
    lvl1: L1;
}

struct L1 {
    lvl2: L2;
}

struct L2 {
    lvl3: L3;
}

struct L3 {
    lvl4: L4;
}

struct L4 {
    num: Int;
    txt: String;
    flag: Bool;
}

contract TestContract {
    val: Deeply;

    init() {
        self.val = Deeply{
            lvl1:L1{
                lvl2:L2{
                    lvl3:L3{
                        lvl4:L4{
                            num:100,
                            txt:"deep test",
                            flag:true
                        }
                    }
                }
            }
        };
    }
}
