struct L5 { val: Int; }
struct L4 { lvl5: L5; }
struct L3 { lvl4: L4; }
struct L2 { lvl3: L3; }
struct L1 { lvl2: L2; }

contract FiveLevels {
    root: L1;

    init() {
        self.root = L1{ lvl2: L2{ lvl3: L3{ lvl4: L4{ lvl5: L5{ val: 7 } } } } };
    }

    receive() {
        dump(self.root.lvl2.lvl3.lvl4.lvl5.val);
    }
}