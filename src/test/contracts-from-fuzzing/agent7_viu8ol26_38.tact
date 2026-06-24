// deep chain of single-field structs with null defaults
struct L1 { f: Int? = null; }
struct L2 { f: L1? = null; }
struct L3 { f: L2? = null; }
struct L4 { f: L3? = null; }

contract NullTower {
    root: L4 = L4{};
}
