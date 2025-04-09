struct Inner1 { x: Int }
struct Inner2 { y: Bool }

contract MultiStructParams(
    p1: Inner1,
    p2: Inner2,
) {}
// different struct types as params