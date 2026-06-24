// Stress deep chain with optional at each level
struct LVL1 { f: Int?; }
struct LVL2 { lvl1: LVL1?; }
struct LVL3 { lvl2: LVL2?; }
struct LVL4 { lvl3: LVL3?; }
struct LVL5 { lvl4: LVL4?; }

contract DeepOpt {
    val: LVL5?;

    init() {
        self.val = LVL5{
            lvl4: LVL4{
                lvl3: LVL3{
                    lvl2: LVL2{
                        lvl1: LVL1{ f: 777 }
                    }
                }
            }
        };
    }
}