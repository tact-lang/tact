// Many nested levels with optionals and defaults
struct L4 { v: Int? }
struct L3 { v: L4 }
struct L2 { v: L3? }
struct L1 { v: L2 }

contract DeepMix {
    state: L1;
    init(){
        self.state = L1{ v: L2{ v: null } };
    }
}