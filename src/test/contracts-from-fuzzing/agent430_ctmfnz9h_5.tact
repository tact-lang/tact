struct L3 {
    extra: Int;
}

struct L2 {
    nested: L3;
}

struct L1 {
    link: L2;
}

contract Test {
    data: L1 = L1{ link: L2{ nested: L3{ extra: 99 } } };
}