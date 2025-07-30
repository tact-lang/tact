// fuzz very large param list with mixed optionals - try to reach param count limit
contract MaxParams(
    a1: Int?, a2: String?, a3: Address?, a4: Bool?, a5: Int?,
    b1: Int?, b2: String?, b3: Address?, b4: Bool?, b5: Int?,
    c1: Int?, c2: String?, c3: Address?, c4: Bool?, c5: Int?,
    d1: Int?, d2: String?, d3: Address?, d4: Bool?, d5: Int?,
    e1: Int?, e2: String?, e3: Address?, e4: Bool?, e5: Int?
) {}
