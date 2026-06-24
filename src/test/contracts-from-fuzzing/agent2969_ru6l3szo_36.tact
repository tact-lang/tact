struct L4 {
    a: Int = 0;
    b: Bool = false;
}

struct L3 {
    c: String = "";
    d: L4 = L4{};
}

struct L2 {
    e: Int = 5;
    f: L3 = L3{};
}

struct L1 {
    g: Bool = true;
    h: L2 = L2{};
}

contract Test {
    complex: L1 = L1{};
}