struct Leaf { num: Int = 42; }

struct L2 { leafOpt: Leaf? = null; }

struct L3 { midOpt: L2?; }

contract PartiallyInitNestedOpt {
    field: L3 = L3{ midOpt: null };
}