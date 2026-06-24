struct SLevel3 { x: Int; y: Bool; }
struct SLevel2 { inner3: SLevel3; flag2: Bool; }
struct SLevel1 { inner2: SLevel2; flag1: Bool; }

contract NestedStructs(
    root: SLevel1
) {}