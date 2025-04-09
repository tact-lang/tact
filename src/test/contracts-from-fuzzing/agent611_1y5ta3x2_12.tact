struct L3 { val: Int? = null; }
struct L2 { v: L3? = null; }
struct L1 { v: L2? = null; }

contract OptDeep {
    d: L1? = null;
}