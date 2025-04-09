struct Lvl4 { v: Int; }
struct Lvl3 { l4: Lvl4; }
struct Lvl2 { l3: Lvl3; }
struct Lvl1 { l2: Lvl2; }

contract FourStructChain {
    c: Lvl1;

    init() {
        self.c = Lvl1{
            l2: Lvl2{
                l3: Lvl3{
                    l4: Lvl4{v: 777}
                }
            }
        };
    }
}