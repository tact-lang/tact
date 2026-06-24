struct Lvl3 { x: Int }
struct Lvl2 { next: Lvl3 }
struct Lvl1 { next: Lvl2 }

contract OptChain {
    opt: Lvl1?;
    init() { self.opt = null; }
}