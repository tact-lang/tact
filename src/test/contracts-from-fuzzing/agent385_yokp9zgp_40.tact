message(7) M7 { val: Int }

struct InnerS { z: Bool? }

contract ComboParams(
    p1: Int,
    p2: Int?,
    p3: Bool,
    p4: Bool?,
    p5: String,
    p6: InnerS,
    p7: M7
) {}
