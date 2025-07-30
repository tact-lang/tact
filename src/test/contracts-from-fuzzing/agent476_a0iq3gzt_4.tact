struct L1 {
    f1: Int;
}
struct L2 {
    i1: L1;
}
struct L3 {
    i2: L2;
}
struct L4 {
    i3: L3;
}
struct L5 {
    i4: L4;
}

contract Test {
    deep: L5;

    init() {
        self.deep = L5{ i4: L4{ i3: L3{ i2: L2{ i1: L1{ f1: 42 } } } } };
    }
}
