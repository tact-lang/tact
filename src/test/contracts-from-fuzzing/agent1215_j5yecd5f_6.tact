struct Inner1 { val: Int; }
struct Inner2 { val: Bool; }
struct Inner3 { val: Address; }
struct Inner4 { val: Cell; }
struct Inner5 { val: Slice; }
struct Inner6 { val: String; }

contract ManyStructs(
    p1: Inner1,
    p2: Inner2,
    p3: Inner3,
    p4: Inner4,
    p5: Inner5,
    p6: Inner6,
) {}