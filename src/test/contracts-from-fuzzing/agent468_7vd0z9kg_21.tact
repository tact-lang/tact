// Contract parameters nested several levels
struct Deep1 {
    x: Int;
    y: String?;
}

struct Deep2 {
    d1: Deep1;
    flag: Bool;
}

contract DeepParams(
    deep: Deep2,
    note: String
) {
    receive() {}
}