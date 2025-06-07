struct L3 { z: Int; }
struct L2 { y: L3; }
struct L1 { x: L2; }

contract CPDeep(
    p: L1,
) {}
