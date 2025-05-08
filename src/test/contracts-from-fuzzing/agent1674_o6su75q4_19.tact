struct Deep3 {
    z: Int;
}

struct Deep2 {
    y: Deep3;
}

struct Deep1 {
    x: Deep2;
}

contract DeepParam(
    nested: Deep1,
) {
}