struct Low {
    small: Int;
    flag: Bool;
}

struct Mid {
    mval: Int;
    l: Low;
}

contract DeepFlatMix(
    aa: Int,
    bb: Bool,
    mm: Mid?,
    cc: String?,
    flag: Bool?,
    count: Int?,
) {
}