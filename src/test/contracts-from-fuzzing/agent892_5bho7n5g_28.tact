// deeply nested contract parameter
contract DeepParam(
    level1: L1
) {
    receive() {}
}

struct L1 {
    l2: L2;
}

struct L2 {
    l3: L3;
}

struct L3 {
    text: String;
}