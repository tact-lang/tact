// optional contract storage of deeply nested struct, no explicit init
struct L0 { a:Int?=null; }
struct L1 { l0:L0?=null; }
struct L2 { l1:L1?=null; }
struct L3 { l2:L2?=null; }
struct L4 { l3:L3?=null; }

contract DeepOptNoInit {
    root:L4?=null;
}