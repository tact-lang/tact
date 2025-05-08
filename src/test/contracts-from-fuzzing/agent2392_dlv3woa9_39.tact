struct S1 { x: Int; y: Bool; }
struct S2 { i: Int; j: Bool; }

contract ManyParams(
    p1: S1,
    p2: Bool?,
    p3: S2,
    p4: Int?,
    p5: String?,
    p6: Bool?,
) {}