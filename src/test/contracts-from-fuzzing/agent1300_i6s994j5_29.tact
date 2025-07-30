struct Leaf { num: Int = 1; }

struct L2 { leafOpt: Leaf? = null; }

struct L3 { midOpt: L2? = null; }

contract MultiOptDefaulted {
    nested: L3 = L3{ midOpt: null };
}