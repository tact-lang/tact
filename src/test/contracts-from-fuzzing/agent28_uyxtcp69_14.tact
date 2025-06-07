struct Deep3 {
    z: Int?;
}

struct Deep2 {
    inner3: Deep3?;
}

struct Deep1 {
    inner2: Deep2?;
}

contract NullableDeepNest(
    p: Deep1?,
) {}