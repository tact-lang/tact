struct Deep1 {
    a: Int = 1;
}

struct Deep2 {
    d1: Deep1 = Deep1{};
}

struct Deep3 {
    d2: Deep2 = Deep2{};
}

contract Test {
    deep: Deep3 = Deep3{};
    init() {}
    receive() {}
}