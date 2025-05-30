struct L3 { v: Int = 99; }
struct L2 { l3: L3?; flag: Bool = false; }
struct L1 { l2: L2?; num: Int = 1; label: String = "abc"; }

contract VeryDeepChain {
    root: L1;

    init() {
        self.root = L1{
            
        };
    }
}