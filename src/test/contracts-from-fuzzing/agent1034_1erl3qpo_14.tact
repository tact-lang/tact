struct S1 { x: Int = 1; }
struct S2 { y: Bool; }

contract HeteroNested {
    part1: S1 = S1{};
    part2: S2 = S2{ y: true };
    partOpt: S2? = null;
}