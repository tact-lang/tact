struct L1 {
    val: Int;
}
struct L2 {
    val: L1;
}
struct L3 {
    val: L2;
}
struct L4 {
    val: L3;
}
struct L5 {
    val: L4;
}
contract DeepChain {
    nested: L5;
    init() {
        self.nested = L5{ val: L4{ val: L3{ val: L2{ val: L1{ val: 9 } } } } };
    }
}