// Deep optional chain with primitive types only
struct Lvl3 { n: Int?; }
struct Lvl2 { l3: Lvl3?; }
struct Lvl1 { l2: Lvl2?; }

contract TestContract {
    l1: Lvl1;

    init() {
        self.l1 = Lvl1{l2: null};
    }

    receive() {
        if (self.l1.l2 != null && self.l1.l2!!.l3 != null && self.l1.l2!!.l3!!.n != null) {
            let _ = self.l1.l2!!.l3!!.n!!;
        }
    }
}