struct SLevel3 {
    d1: String;
    d2: Int?;
}

struct SLevel2 {
    c1: Int;
    c2: SLevel3?;
}

struct SLevel1 {
    b1: Bool;
    b2: SLevel2;
}

contract VeryDeepNested(
    deepField: SLevel1?,
    ready: Bool,
    msg: String,
) {
}