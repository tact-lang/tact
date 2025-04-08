struct Chain3 {
    a: Int;
}
struct Chain2 {
    c3: Chain3;
}
struct Chain1 {
    c2: Chain2;
}

contract NestedChain {
    val: Chain1;

    init() {
        self.val = Chain1{ c2: Chain2{ c3: Chain3{ a: 42 } } };
    }
}